import * as functions from "firebase-functions";

import {
  HarmBlockThreshold,
  HarmCategory,
  VertexAI,
} from "@google-cloud/vertexai";

/**
 * This is a JSDoc comment for the addProductsFromImage function.
 *
 */
export const addProductsFromImage = functions.https.onCall(
    async (data, context) => {
      console.log("auth check");
      if (!context.auth) {
      // Throwing an HttpsError so that the client gets the error details.
        throw new functions.https.HttpsError("failed-precondition", "The function must be called while authenticated.");
      }
      console.log(data);

      const response = await generateContent(data["imageUrl"] as string);
      console.log("response received");

      if (!response) {
        console.log("no response!");
        return {
          code: 400,
        };
      }

      console.log("firestore writing...");

      // Add products to the firestore
      const {getFirestore} = await import("firebase-admin/firestore");

      const productRef = await getFirestore()
          .collection("stores")
          .doc(data["storeId"] as string)
          .collection("products")
          .doc();

      const storeId = productRef.id;

      await productRef.set({...JSON.parse(response), storeId: storeId});

      return {
        code: 200,
      };
    }
);

// Initialize Vertex with your Cloud project and location
const vertexAi = new VertexAI({
  project: "restaurant-app-25f83",
  location: "us-central1",
});
const model = "gemini-1.0-pro-vision-001";

// Instantiate the models
const generativeModel = vertexAi.preview.getGenerativeModel({
  model: model,
  generation_config: {
    max_output_tokens: 2048,
    temperature: 0,
    top_p: 1,
    top_k: 32,
  },
  safety_settings: [
    {
      category: HarmCategory.HARM_CATEGORY_HATE_SPEECH,
      threshold: HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
    },
    {
      category: HarmCategory.HARM_CATEGORY_DANGEROUS_CONTENT,
      threshold: HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
    },
    {
      category: HarmCategory.HARM_CATEGORY_SEXUALLY_EXPLICIT,
      threshold: HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
    },
    {
      category: HarmCategory.HARM_CATEGORY_HARASSMENT,
      threshold: HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
    },
  ],
});

/**
 * This is a JSDoc comment for the generateContent function.
 * @param {string} imageUrl - Description of the imageUrl parameter.
 *
 */
async function generateContent(imageUrl: string): Promise<string | null> {
  const req = {
    contents: [
      {
        role: "user",
        parts: [
          {
            file_data: {
              file_uri: `gs://restaurant-app-25f83.appspot.com/${imageUrl}`,
              mime_type: "image/png",
            },
          },
          {
            text: "From the given restaurant menu image give me content of the menu in format like in this example:",
          },
          {
            text: "{\"storeId\": \"1000\",\"categories\": [{\"name\": \"Askıda Yemek Hediye Et\",\"items\": " +
              "[{\"id\": 99,\"name\": \"Askıya Bırak - 1 Kilo Çiğ Köfte\",\"price\": \"160.0\"," +
              "\"description\": \"1 Göbek Marul, nane,maydanoz, acı sos, nar ekşisi, 8 adet lavaş\",\"currency\": \"TRY\"}]}, ]}",
          },
          {
            text: "Inside categories list we should have a list of menu items, focus on name, price, currency  and description fields, " +
              "for every product id set a random number between 0 and 1000",
          },
          {
            text: "Every category should have an id field next to items and name fields, it should be a random number between 0 and 1000",
          },
        ],
      },
    ],
  };
  console.log("calling generateContentStream");
  const streamingResp = await generativeModel.generateContentStream(req);
  console.log("finished calling generateContentStream");

  const aggregatedResponse = await streamingResp.response;

  console.log(aggregatedResponse);

  const finishReason = aggregatedResponse.candidates[0].finishReason;

  if (finishReason !== "STOP") {
    console.log(
        "AddProductsFromImage-Error: Could not complete parsing of menu items."
    );

    return null;
  }

  const products = aggregatedResponse.candidates[0].content.parts[0].text ?? "";

  if (products === "") {
    console.log("AddProductsFromImage-Error: There is no loaded products.");
    return null;
  }

  console.log(
      "AddProductsFromImage-Success: Successfully finished fetching menu items from the image."
  );

  const formattedProducts = products
      .replace("json", "")
      .replaceAll("\n", "")
      .replaceAll("`", "");

  console.log(formattedProducts);

  return formattedProducts;
}
