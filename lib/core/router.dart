import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/app/my_home_page.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/domain/entities/address.dart';
import 'package:kachpara/domain/entities/category.dart';
import 'package:kachpara/ui/add_address_page/add_address_page.dart';
import 'package:kachpara/ui/add_payment_methods_page/add_payment_methods_page.dart';
import 'package:kachpara/ui/add_student_email_page/add_student_email_page.dart';
import 'package:kachpara/ui/address_list_page/address_list_page.dart';
import 'package:kachpara/ui/checkout_page/checkout_page.dart';
import 'package:kachpara/ui/claim_free_promotion_page/claim_free_promotion_page.dart';
import 'package:kachpara/ui/claim_free_promotion_success_page/claim_free_promotion_success_page.dart';
import 'package:kachpara/ui/claim_gift_page/claim_gift_page.dart';
import 'package:kachpara/ui/competition_page/competition_page.dart';
import 'package:kachpara/ui/contacts_page/contacts_page.dart';
import 'package:kachpara/ui/curation_detail_page/curation_detail_page.dart';
import 'package:kachpara/ui/earnings_page/earnings_page.dart';
import 'package:kachpara/ui/edit_product_page/edit_product_page.dart';
import 'package:kachpara/ui/feed_page/feed_page.dart';
import 'package:kachpara/ui/gifts_page/gifts_page.dart';
import 'package:kachpara/ui/google_map_store_detail_page/store_map_from_map_details_page.dart';
import 'package:kachpara/ui/home_page/home_page.dart';
import 'package:kachpara/ui/leaderboard_page/leaderboard_page.dart';
import 'package:kachpara/ui/loyalty_page/loyalty_page.dart';
import 'package:kachpara/ui/my_oders_page/my_orders_page.dart';
import 'package:kachpara/ui/onboard_page/onboard_page.dart';
import 'package:kachpara/ui/order_detail_page/order_detail_page.dart';
import 'package:kachpara/ui/order_success_page/order_success_page.dart';
import 'package:kachpara/ui/payment_methods_page/payment_methods_page.dart';
import 'package:kachpara/ui/qr_code_scanning_page/qr_code_scanning_page.dart';
import 'package:kachpara/ui/referral_code_entry_page/referral_code_entry_page.dart';
import 'package:kachpara/ui/send_gift_page/send_gift_page.dart';
import 'package:kachpara/ui/store_details_page/store_details_page.dart';
import 'package:kachpara/ui/transaction_page/transaction_page.dart';
import 'package:kachpara/ui/verify_student_email_page/verify_student_email_page.dart';
import 'package:kachpara/ui/view_user_stores_page/view_user_stores_page.dart';
import 'package:kachpara/ui/transfer_coin_page/transfer_coin_page.dart';
import 'package:kachpara/ui/wallet_page/wallet_page.dart';
import 'package:kachpara/ui/web_page.dart/web_page.dart';

import '../domain/entities/curation.dart';
import '../domain/entities/order.dart';
import '../ui/all_promotions_page/all_promotions_page.dart';
import '../ui/buy_gift_page/buy_gift_page.dart';
import '../ui/cart_page/cart_page.dart';
import '../ui/login_page/login_page.dart';
import '../ui/products_list_page/product_list_page.dart';
import '../ui/profile_page/profile_page.dart';
import '../ui/promotions_page/promotions_page.dart';
import '../ui/register_page/register_page.dart';
import '../ui/reward_share_page/reward_share_page.dart';
import '../ui/store_list_page/store_list_page.dart';
import 'injector.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator = GlobalKey(debugLabel: 'shell');

@singleton
@injectable
class AppRouter {
  AppRouter(this._auth);
  final FirebaseAuth _auth;

  static final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

  GoRouter router() {
    final authStream = getIt<UserBloc>();
    if (_auth.currentUser != null) {
      authStream.add(const UserEvent.initializeUser());
    }

    return GoRouter(
        navigatorKey: _rootNavigator,
        initialLocation: '/',
        routes: [
          GoRoute(
              path: '/login_page',
              name: LoginPage.routeName,
              builder: (ctx, state) {
                return const LoginPage();
              }),
          GoRoute(path: '/register_page', name: RegisterPage.routeName, builder: (ctx, state) => const RegisterPage()),
          ShellRoute(
              navigatorKey: _shellNavigator,
              builder: (_, state, child) {
                return MyHomePage(child: child);
                // );
              },
              routes: _routes)
        ],
        observers: [routeObserver],
        redirect: (BuildContext context, GoRouterState state) {
          if (_auth.currentUser == null) {
            return "/${LoginPage.routeName}";
          } else if (authStream.state.gotoPage == GotoPage.newUserReg) {
            return "/${RegisterPage.routeName}";
          } else {
            return null;
          }
        },
        refreshListenable: GoRouterRefreshStream(authStream.stream));
  }

  static final _routes = [
    GoRoute(
        parentNavigatorKey: _shellNavigator,
        path: '/',
        name: HomePage.routeName,
        builder: (ctx, state) {
          return const HomePage();
        },
        routes: [
          _productListPageRoute,
          _leaderboardPageRoute,
          _competitionPageRoute,
          _storeListPageRoute,
          _referralCodeEntryPageRoute,
          _cartPageRoute,
          _profilePageRoute,
          _claimFreePromotionPage,
          _checkoutPageRoute,
          _myOrdersPageRoute,
          _addAddressPageRoute,
          _addPaymentMethodsPageRoute,
          _addStudentEmailPage,
          _paymentMethodsPageRoute,
          _orderSuccessPageRoute,
          _orderdetailsPageRoute,
          _promotionsPageRoute,
          _allPromotionsPageRoute,
          _rewardSharePageRoute,
          _walletPageRoute,
          _loyaltyPageRoute,
          _onboardPageRoute,
          _earningsPageRoute,
          _curationDetailPageRoute,
          _verifyStudentEmailPageRoute,
          _claimFreePromotionSuccessPageRoute,
          _sendGiftPageRoute,
          _giftsPageRoute,
          _claimGiftPage,
          _storeFromMapDetailPage,
          _contactsPageRoute,
          _viewUserStoresPageRoute,
          _buyGiftPageRoute,
          _feedPageRoute,
          _storeDetailsPageRoute,
        ])
  ];

  static final _storeListPageRoute = GoRoute(
      path: 'store_list_page',
      name: StoreListPage.routeName,
      builder: (ctx, state) {
        final curation = state.extra as Curation;
        return StoreListPage(
          curation: curation,
        );
      });
  static final _storeFromMapDetailPage = GoRoute(
      path: 'store_from_map_detail_page',
      name: StoreFromMapDetailPage.routeName,
      builder: (ctx, state) {
        String? name = state.uri.queryParameters['name'];
        String? lat = state.uri.queryParameters['lat'];
        String? lng = state.uri.queryParameters['lng'];
        return StoreFromMapDetailPage(name: name!, lat: lat!, lng: lng!);
      });
  static final _productListPageRoute = GoRoute(
      parentNavigatorKey: _rootNavigator,
      path: 'product_list_page',
      name: ProductListpage.routeName,
      routes: [
        _editProductPageRoute,
      ],
      builder: (ctx, state) {
        String? storeId = state.uri.queryParameters['storeId'];
        String? referralCode = state.uri.queryParameters['referralCode'];
        String? curationId = state.uri.queryParameters['curationId'];
        storeId = "$storeId-$curationId";
        return ProductListpage(storeId: storeId, referralCode: referralCode);
      });
  static final _sendGiftPageRoute = GoRoute(
      path: 'send_gift_page',
      name: SendGiftPage.routeName,
      builder: (ctx, state) {
        String? storeId = state.uri.queryParameters['storeId'];
        String? promotionId = state.uri.queryParameters['promotionId'];
        String? userId = state.uri.queryParameters['userId'];
        return SendGiftPage(userId: userId, storeId: storeId!, promotionId: promotionId!);
      });
  static final _buyGiftPageRoute = GoRoute(
      path: 'buy_gift_page',
      name: BuyGiftPage.routeName,
      builder: (ctx, state) {
        String? storeId = state.uri.queryParameters['storeId'];
        String? promotionId = state.uri.queryParameters['promotionId'];
        String? userId = state.uri.queryParameters['userId'];
        return BuyGiftPage(userId: userId, storeId: storeId!, promotionId: promotionId!);
      });
  static final _giftsPageRoute = GoRoute(
      path: 'gifts_page',
      name: GiftsPage.routeName,
      builder: (ctx, state) {
        return const GiftsPage();
      });
  static final _referralCodeEntryPageRoute = GoRoute(
      path: 'referral_code_entry_page',
      name: ReferralCodeEntryPage.routeName,
      routes: [],
      pageBuilder: (ctx, state) {
        final code = state.extra as String?;
        print('code: $code');
        return CustomTransitionPage(
            key: state.pageKey,
            opaque: false,
            child: ReferralCodeEntryPage(
              code: code,
            ),
            transitionsBuilder: (ctx, anim1, anim2, child) => child);
      });
  static final _cartPageRoute = GoRoute(path: 'cart_page', name: CartPage.routeName, builder: (ctx, state) => const CartPage());
  static final _claimFreePromotionPage = GoRoute(
      path: 'claim_free_promotion_page',
      name: ClaimFreePromotionPage.routeName,
      builder: (ctx, state) {
        final storeId = state.uri.queryParameters["storeId"]!;
        final promotionId = state.uri.queryParameters["promotionId"]!;
        return ClaimFreePromotionPage(
          storeId: storeId,
          promotionId: promotionId,
        );
      });
  static final _claimGiftPage = GoRoute(
      path: 'claim_gift_page',
      name: ClaimGiftPage.routeName,
      builder: (ctx, state) {
        final orderId = state.uri.queryParameters["orderId"]!;
        return ClaimGiftPage(
          orderId: orderId,
        );
      });
  static final _checkoutPageRoute = GoRoute(
      parentNavigatorKey: _rootNavigator,
      path: 'checkout_page',
      name: CheckoutPage.routeName,
      routes: [
        _addressListPageRoute,
      ],
      builder: (ctx, state) {
        final store = state.uri.queryParameters["storeId"]!;
        return CheckoutPage(
          storeId: store,
        );
      });
  static final _profilePageRoute = GoRoute(path: 'profile_page', name: ProfilePage.routeName, builder: (ctx, state) => const ProfilePage());
  // static final _registerPageRoute = GoRoute(path: 'register_page', name: RegisterPage.routeName, builder: (ctx, state) => const RegisterPage());
  static final _qrCodePageRoute = GoRoute(
      path: 'qr_code_page',
      name: QrCodeScanningPage.routeName,
      builder: (ctx, state) {
        return const QrCodeScanningPage();
      });

  static final _myOrdersPageRoute = GoRoute(
      path: 'my_orders_page',
      name: MyOrdersPage.routeName,
      builder: (ctx, state) {
        return const MyOrdersPage();
      });
  static final _orderdetailsPageRoute = GoRoute(
      path: 'order_details_page/:orderId',
      name: OrderDetailPage.routeName,
      builder: (ctx, state) {
        final orderId = state.pathParameters["orderId"] as String;
        final order = state.extra as Order?;
        return OrderDetailPage(
          orderId: orderId,
          order: order,
        );
      });
  static final _orderSuccessPageRoute = GoRoute(
      path: 'order_success_page/:orderId',
      name: OrderSuccessPage.routeName,
      builder: (ctx, state) {
        final orderId = state.pathParameters["orderId"] as String;
        return OrderSuccessPage(
          orderId: orderId,
        );
      });
  static final _claimFreePromotionSuccessPageRoute = GoRoute(
      path: 'claim_free_promotion_success_page',
      name: ClaimFreePromotionSuccessPage.routeName,
      builder: (ctx, state) {
        final promotionTitle = state.uri.queryParameters["promotionTitle"] as String;
        final storeUrl = state.uri.queryParameters["storeUrl"] as String;
        return ClaimFreePromotionSuccessPage(promotionTitle: promotionTitle, storeUrl: storeUrl);
      });
  static final _addAddressPageRoute = GoRoute(
      parentNavigatorKey: _rootNavigator,
      path: 'add_address_page',
      name: AddAddressPage.routeName,
      builder: (ctx, state) {
        final address = state.extra as Address?;
        return AddAddressPage(
          address: address,
        );
      });
  static final _addPaymentMethodsPageRoute = GoRoute(
      parentNavigatorKey: _rootNavigator,
      path: 'add_payment_methods_page',
      name: AddPaymentMethodsPage.routeName,
      builder: (ctx, state) {
        return const AddPaymentMethodsPage();
      });
  static final _addStudentEmailPage = GoRoute(
      path: 'add_student_email_page',
      name: AddStudentEmailPage.routeName,
      builder: (ctx, state) {
        return const AddStudentEmailPage();
      });
  static final _paymentMethodsPageRoute = GoRoute(
      parentNavigatorKey: _rootNavigator,
      path: 'payment_methods_page',
      name: PaymentMethodsPage.routeName,
      builder: (ctx, state) {
        return const PaymentMethodsPage();
      });
  static final _addressListPageRoute = GoRoute(
      parentNavigatorKey: _rootNavigator,
      path: 'address_list_page',
      name: AddressListPage.routeName,
      builder: (ctx, state) {
        return const AddressListPage();
      });
  static final _promotionsPageRoute = GoRoute(
      parentNavigatorKey: _rootNavigator,
      path: 'promotional_page',
      name: PromotionsPage.routeName,
      builder: (ctx, state) {
        final storename = state.uri.queryParameters["storeName"];
        final storeId = int.parse((state.uri.queryParameters["storeId"] as String));
        return PromotionsPage(
          storeName: storename ?? "",
          storeId: storeId,
        );
      });
  static final _allPromotionsPageRoute = GoRoute(
      path: 'all_promotions_page',
      name: AllPromotionsPage.routeName,
      builder: (ctx, state) {
        return const AllPromotionsPage();
      });
  static final _rewardSharePageRoute = GoRoute(
      path: 'reward_share_page',
      name: RewardSharePage.routeName,
      builder: (ctx, state) {
        final storeId = state.uri.queryParameters["storeId"]!;
        return RewardSharePage(
          storeId: storeId,
        );
      });
  static final _walletPageRoute = GoRoute(
    path: 'wallet_page',
    name: WalletPage.routeName,
    builder: (ctx, state) {
      return const WalletPage();
    },
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: _transferCoinPage.path,
        name: _transferCoinPage.name,
        builder: _transferCoinPage.builder,
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: _transactionPage.path,
        name: _transactionPage.name,
        builder: _transactionPage.builder,
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: _webPage.path,
        name: _webPage.name,
        builder: _webPage.builder,
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: _qrCodePageRoute.path,
        name: _qrCodePageRoute.name,
        builder: _qrCodePageRoute.builder,
      )
    ],
  );
  static final _loyaltyPageRoute = GoRoute(
      path: 'loyalty_page',
      name: LoyaltyPage.routeName,
      builder: (ctx, state) {
        final storeId = state.uri.queryParameters["storeId"]!;
        return LoyaltyPage(
          storeId: storeId,
        );
      });
  static final _onboardPageRoute = GoRoute(
      path: 'onboard_page',
      name: OnboardPage.routeName,
      builder: (ctx, state) {
        final storeId = state.uri.queryParameters["storeId"]!;
        return OnboardPage(
          storeId: storeId,
        );
      });
  static final _leaderboardPageRoute = GoRoute(
      path: 'leaderboard_page',
      name: LeaderboardPage.routeName,
      builder: (ctx, state) {
        final storeId = state.uri.queryParameters["storeId"]!;
        final storeName = state.uri.queryParameters["storeName"]!;
        return LeaderboardPage(
          storeId: storeId,
          storeName: storeName,
        );
      });
  static final _feedPageRoute = GoRoute(
      path: 'feed_page',
      name: FeedPage.routeName,
      builder: (ctx, state) {
        return const FeedPage();
      });
  static final _competitionPageRoute = GoRoute(
      path: 'competition_page',
      name: CompetitionPage.routeName,
      builder: (ctx, state) {
        final storeId = state.uri.queryParameters["storeId"]!;
        final storeName = state.uri.queryParameters["storeName"]!;
        return CompetitionPage(
          storeId: storeId,
          storeName: storeName,
        );
      });
  static final _earningsPageRoute = GoRoute(
      path: 'earnings_page',
      name: EarningsPage.routeName,
      builder: (ctx, state) {
        return const EarningsPage();
      });

  static final _curationDetailPageRoute = GoRoute(
      path: 'curation_detail_page/:curationId',
      name: CurationDetailPage.routeName,
      builder: (ctx, state) {
        final curationId = int.parse(state.pathParameters["curationId"] as String);
        return CurationDetailPage(
          curationId: curationId,
        );
      });

  static final _verifyStudentEmailPageRoute = GoRoute(
      path: 'verify_student_email_page/:student_email/:verification_code',
      name: VerifyStudentEmailPage.routeName,
      builder: (ctx, state) {
        return VerifyStudentEmailPage(
          studentEmail: state.pathParameters["student_email"] ?? "",
          verificationCode: state.pathParameters["verification_code"] ?? "",
        );
      });

  static final _contactsPageRoute = GoRoute(
      path: 'contacts_page',
      name: ContactsPage.routeName,
      builder: (ctx, state) {
        return const ContactsPage();
      });

  static final _viewUserStoresPageRoute = GoRoute(
      path: 'view_user_stores_page',
      name: ViewUserStoresPage.routeName,
      builder: (ctx, state) {
        return ViewUserStoresPage(id: state.uri.queryParameters["id"]!);
      });

  static final _editProductPageRoute = GoRoute(
      parentNavigatorKey: _rootNavigator,
      path: 'edit_product_page/:storeId',
      name: EditProductPage.routeName,
      builder: (ctx, state) {
        return EditProductPage(
          productCategory: state.extra as Category?,
          storeId: state.pathParameters['storeId']!,
        );
      });

  static final _storeDetailsPageRoute = GoRoute(
      parentNavigatorKey: _rootNavigator,
      path: 'store_details_page',
      name: StoreDetailsPage.routeName,
      routes: [
        GoRoute(
          parentNavigatorKey: _rootNavigator,
          path: _storeFromMapDetailPage.path,
          name: 'details_store_from_map_detail_page',
          builder: _storeFromMapDetailPage.builder,
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigator,
          name: 'details_product_list_page',
          path: _productListPageRoute.path,
          builder: _productListPageRoute.builder,
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigator,
          path: _rewardSharePageRoute.path,
          name: 'details_rewards_share_page_route',
          builder: _rewardSharePageRoute.builder,
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigator,
          path: _loyaltyPageRoute.path,
          name: 'details_loyalty_page',
          builder: _loyaltyPageRoute.builder,
        ),
      ],
      builder: (ctx, state) {
        return StoreDetailsPage(
          storeId: state.uri.queryParameters['storeId']!,
        );
      });
  static final _transferCoinPage = GoRoute(
      path: 'transfer_coin_page',
      name: TransferCoinPage.routeName,
      builder: (ctx, state) {
        final availableBalance = state.uri.queryParameters["availableBalance"]!;
        final walletId = state.uri.queryParameters["walletId"]!;
        final tokenId = state.uri.queryParameters["tokenId"]!;
        return TransferCoinPage(
          availableBalance: availableBalance,
          walletId: walletId,
          tokenId: tokenId,
        );
      });

  static final _transactionPage = GoRoute(
      path: 'transaction_page',
      name: TransactionPage.routeName,
      builder: (ctx, state) {
        final id = state.uri.queryParameters["id"] ?? "";
        return TransactionPage(id: id);
      });
  static final _webPage = GoRoute(
      path: 'web_page',
      name: WebPage.routeName,
      builder: (ctx, state) {
        final url = state.uri.queryParameters["url"] ?? "";
        final title = state.uri.queryParameters["title"] ?? "";
        return WebPage(url: url, title: title);
      });
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
