import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/app/store_bloc/store_bloc.dart';
import 'package:kachpara/ui/contacts_page/contacts_page.dart';
import 'package:kachpara/ui/feed_page/feed_page.dart';
import 'package:kachpara/ui/home_page/home_page.dart';
import 'package:kachpara/ui/profile_page/profile_page.dart';
import 'package:kachpara/ui/wallet_page/wallet_page.dart';
import 'package:kachpara/utils/status.dart';
import 'package:kachpara/l10n/extensions/extensions.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = 'my_home_page';
  final Widget child;
  const MyHomePage({required this.child, super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    initApp();
  }

  void initApp() async {
    // Proceed with other initializations
    initDynamicLinks();
    setupInteractedMessage();
  }

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  void _handleMessage(RemoteMessage message) {
    final String page = message.data['page'] ?? '';
    final Map<String, String> queryParameters = Map<String, String>.from(message.data);

    // Remove the 'page' key from query parameters, as it is used as the route name
    queryParameters.remove('page');

    // Handle different page values
    context.goNamed(page, queryParameters: queryParameters);
  }

  Future<void> initDynamicLinks() async {
    // Check if you received the link via `getInitialLink` first
    final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();

    if (initialLink != null) {
      final Uri deepLink = initialLink.link;
      // Example of using the dynamic link to push the user to a different screen
      context.goNamed(deepLink.path.substring(1), queryParameters: deepLink.queryParameters);
    }

    FirebaseDynamicLinks.instance.onLink.listen(
      (pendingDynamicLinkData) {
        // Set up the `onLink` event listener next as it may be received here
        final Uri deepLink = pendingDynamicLinkData.link;
        context.goNamed(deepLink.path.substring(1), queryParameters: deepLink.queryParameters);
      },
    );
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StoreBloc, StoreBlocState>(
        builder: (context, state) {
          if (state.getStoresStatus == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return widget.child;
        },
      ),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.greenAccent,
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;

            switch (index) {
              case 0:
                context.goNamed(HomePage.routeName);
                break;
              case 1:
                context.goNamed(WalletPage.routeName);
                break;
              case 2:
                context.goNamed(ContactsPage.routeName);
                break;
              case 3:
                context.goNamed(FeedPage.routeName);
                break;
              case 4:
                context.goNamed(ProfilePage.routeName);
                break;
              default:
            }
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.store),
            label: context.l10n.my_home_page_stores,
          ),
          NavigationDestination(
            icon: const Icon(Icons.monetization_on),
            label: context.l10n.profits,
          ),
          // NavigationDestination(
          //   icon: Icon(Icons.feed),
          //   label: 'Fırstalar',
          // ),
          NavigationDestination(
            icon: Icon(Icons.group),
            label: context.l10n.my_home_page_contacts,
          ),
          NavigationDestination(
            icon: Icon(Icons.feed_outlined),
            label: context.l10n.my_home_page_social_feed,
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: context.l10n.my_home_page_profile,
          ),
        ],
      ),
    );
  }
}
