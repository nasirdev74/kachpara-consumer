# kachpara

Kachpara is a community driven marketplace.

## Localizations

Kachpara project translations are done per page basis. Each translation takes folder name under `ui` as prefix. For instance, all home page translations should start with `home_page_xxxx`.

Second important thing is the messages. Format for the messages are `home_page_message_xxx`. Messages are the sections where we tell something to the user. It can be a warning, alert or info.

Everytime you change a translation file under `lib/l10n/arb`, you should run `flutter gen-l10n` to generate new translations to use in the app.

## External Datasource Configuration

`injector.module.dart` is where we configure external datasources with proper environment parameters (i.e test,prod)

Based on environment settings, those datasource objects are injected with the right parameters and also the same for firebase service for test enviroment it connect to the local running emulator.

To Test locally firebase callable cloud function make sure the local emulator is running by `cd functions && npm run serve`

Currently only cloud functions emulator is supported

## Localization and .arb files

- Do not forget to add translations to every .arb file under `lib/l10n/arb/`
- use `flutter gen-l10n` to generate localization files after every change
- use this format to retrieve tranlations `context.l10n.home_page_stores`
- use `app_en.arb` as template file so all placeholder metadata have to go in there
- each key in the .arb file has to follow the syntax `pagename_key` like `home_page_stores`. You have to follow that pattern for each page under `ui` folder. Do not create any entry that does not match page name. The only exception to it is `common_x` where we need to put truly generic translations accross the app.

## Dart Source Code Formatting

We use default dart formatter that comes with Flutter VSCode Extension. You can also format the code if needed via `flutter format .`

## Local Developement with firebase cloud functions

To run and start the emulator `cd functions` and then `npm run serve`

- to set the `SendGrid` api key env variable, put it inside the `.env` file inside `functions` folder under the name `SENDGRID_API_KEY`
- to set the `SendGrid` template id for sending email with pre-build template, put it inside the `.env` file inside `functions` folder under the name `TEMPLATE_ID`
- run `tsc --watch` in a seperate terminal to compile changes from ts to js.
- `npm update --latest` and `npm install` might be required sometimes.

## Set up Developemnt keys and Production keys in firebase cloud functions

- for **Developemnt keys** they should be kept inside the `.env` file and secrets (i.e. stripe keys) in `.setup.local`
- for **Production keys** they should be deploy to `Google Cloud Secret Manager` to be stored with the command `firebase functions:secrets:set API_KEY_NAME` then enter it's value from the command line
  And to give the cloud function access to the secret manager use the `runWith` functions with list secrets names

```javascript
functions.runWith
({secrets: [API_KEY_NAME]}).
https.
onRequest(
```

### Create Stores and Promotions and Lists

for creating stores and promotions and lists, use the corresponding cloud function and supply it's arguments

- `Store`
  call `addNewStore` function and provider the required arguments:

```
cd functions && curl  -X POST http://127.0.0.1:5001/restaurant-app-25f83/us-central1/addNewStore  -H "Content-Type: application/json" --json @store.txt
```

- the `store.txt` file contain

```
{
    "address": "" // string,
    "currency": "" // string,
    "currencySymbol": "" // string,
    "id": 211 //number,
    "lat": "90.32222" // string,
    "lng": "32.03333" // string,
    "name": "" // string,
    "referralCode": "" // string,
    "reward": {
        "listAmount": 8,
        "storeAmount": 10
    },
    "storeId": 211 // number,
    "whatsapp": "" // string,
}
```

- `Promotions`
  call `addNewStorePromotion` function and provider the required arguments:

```
cd functions && curl  -X POST http://127.0.0.1:5001/restaurant-app-25f83/us-central1/addNewStorePromotion  -H "Content-Type: application/json" --json @promotion.txt
```

- the `promotion.txt` file contain

```
{
    "startDate": "2023-04-10 06:24:12",
    "promotionId": "bSCUn2WAN70E6AJOO44t",
    "claimBeginTime": 12,
    "claimEndTime": 18,
    "dailyLimit": 2,
    "description": "Free Burger Menu for Students",
    "endDate": "2023-02-10 06:24:12",
    "forStudent": true,
    "isEnabled": true,
    "offerText": "Free Food for Students. .edu email is required",
    "storeId": 336,
    "orderLimit": 5,
    "products": [
        {
        "currency": "TRY",
        "id": 322,
        "name": "Büyük Ayran",
        "price": "12",
        "priceWithSign": "₺10"
        }
        ],
    "storeName": "Dürümcü Mahmut",
    "title": "Free Food",
    "type": "FREE"
}
```

- `Lists`
  call `addNewList` function and provider the required arguments:

```
cd functions && curl  -X POST http://127.0.0.1:5001/restaurant-app-25f83/us-central1/addNewList  -H "Content-Type: application/json" --json @list.txt
```

- the `list.txt` file contain

```
{
    "curatorName": "Neli nical",
    "description": "bSCUn2WAN70E6AJOO44t",
    "name": "solidol",
    "referralCode": "MOLLL",
    "stores": [
    // stores id
    ],
    "id": 211,
    "imageFileName": "https://picsum.photos/200"
}
```

## Firebase Shell

```
firebase functions:shell
```

call any function with sample data in a json file as below

```
firebase > var sampleProducts = require('./sample-json-data/sample-store-products.json')
firebase > addNewStoreProducts(sampleProducts)

```

When calling local firebase functions, you do not have to start any other emulator session like `firebase emulators:start` or `npm run serve`. For firestore, it will directly use prod firestore.

## Integration Testing

### Test Data Cleanup

make sure you have configured `TEST_PHONE_NUMBER` in `functions/.env` file then run following command to cleanup firestore and firebase auth

```
curl http://127.0.0.1:5001/restaurant-app-25f83/us-central1/cleanup
```

### emulator start with wipe-data option

```
emulator -avd Pixel_3a_API_32_arm64-v8a -wipe-data -change-language tr
```

### Execute Integration Tests

- The `PHONE_NUMBER` for Test Phone Number and the `PIN_CODE` for test pin code are added as environment variables inside the `.env` file, then referenced inside the integration test
- and the `.env` file should place in root of the project
  to add any other environment variables see the [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) docs.

Run following commands to start testing.

```
flutter test integration_test/scenarios/first_purchase_promotion_test.dart
flutter test integration_test/scenarios/profile_test.dart
```

## Using Secret Manager in Prod

Following Keys created in Prod already

- firebase functions:secrets:set SENDGRID_API_KEY
- firebase functions:secrets:set TEMPLATE_ID
- firebase functions:secrets:set STRIPE_SECRET_KEY
- firebase functions:secrets:set WEB_API_KEY
- firebase functions:config:set google_service_account="$(cat /Users/mesutcelik/Downloads/restaurant-app-25f83-622f33f879e6.json)"

## Firebase App SHA1 and SHA256 configuration

Firebase App SHA1 and SHA256 configuration in Firebase Console
https://play.google.com/console/u/0/developers/5265868398922592581/app/4973378500936617338/keymanagement?tab=appSigning

We use only upload key on local build. Real app signing key is stored by Google playstore.

## Set up NFC tag

NFC tag can be set up from both iOS and Android devices, using the app call "NFC Tools"
Steps to set up NFC tag:

- Open the "NFC Tools" app
- Go to the "Write" screen
- Click "Add Record" button
- Go to the bottom, click the "Data" button
- Content type fields should be set to text/plain
- Data field should be in the format "storeId: 999"
- Click on the "Write" button and then put a phone near the tag device to overwrite it
- Proces is complete, tag should work for the store with the id 999
