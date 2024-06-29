// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:cloud_functions/cloud_functions.dart' as _i6;
import 'package:firebase_analytics/firebase_analytics.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_messaging/firebase_messaging.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/cart_bloc/cart_bloc.dart' as _i56;
import '../app/curation_bloc/curation_bloc.dart' as _i83;
import '../app/selected_items_bloc/selected_items_bloc.dart' as _i47;
import '../app/store_bloc/store_bloc.dart' as _i73;
import '../app/user_bloc/user_bloc.dart' as _i49;
import '../data/sources/cloud_functions/circle_functions.dart' as _i32;
import '../data/sources/cloud_functions/sendgrid.dart' as _i14;
import '../data/sources/cloud_functions/stripe_functions.dart' as _i16;
import '../data/sources/firebase_auth/auth_data.dart' as _i26;
import '../data/sources/firestore/address_data.dart' as _i23;
import '../data/sources/firestore/cart_data.dart' as _i28;
import '../data/sources/firestore/category_data.dart' as _i30;
import '../data/sources/firestore/curation_data.dart' as _i34;
import '../data/sources/firestore/earnings_and_reward_usage_data.dart' as _i35;
import '../data/sources/firestore/feed_data.dart' as _i37;
import '../data/sources/firestore/gifts_data.dart' as _i8;
import '../data/sources/firestore/order_data.dart' as _i10;
import '../data/sources/firestore/product_data.dart' as _i11;
import '../data/sources/firestore/promotions_data.dart' as _i13;
import '../data/sources/firestore/store_data.dart' as _i15;
import '../data/sources/firestore/user_data.dart' as _i17;
import '../data/sources/firestore/wallet_data.dart' as _i21;
import '../data/sources/geo_location/user_location.dart' as _i18;
import '../domain/entities/order.dart' as _i87;
import '../domain/usecases/address_usecase.dart' as _i24;
import '../domain/usecases/auth_usecase.dart' as _i27;
import '../domain/usecases/cart_usecases.dart' as _i29;
import '../domain/usecases/category_usecase.dart' as _i31;
import '../domain/usecases/contacts_usecase.dart' as _i33;
import '../domain/usecases/curation_usecase.dart' as _i59;
import '../domain/usecases/earnings_and_reward_usage.dart' as _i60;
import '../domain/usecases/feed_usecase.dart' as _i38;
import '../domain/usecases/gifts_usecase.dart' as _i9;
import '../domain/usecases/order_usecase.dart' as _i67;
import '../domain/usecases/payment_usecase.dart' as _i42;
import '../domain/usecases/product_usecase.dart' as _i12;
import '../domain/usecases/promotions_usecase.dart' as _i44;
import '../domain/usecases/store_usecase.dart' as _i48;
import '../domain/usecases/user_usecase.dart' as _i19;
import '../domain/usecases/wallet_use_cases.dart' as _i51;
import '../ui/add_address_page/cubit/add_address_page_cubit.dart' as _i52;
import '../ui/add_payment_methods_page/cubit/add_payment_methods_page_cubit.dart'
    as _i53;
import '../ui/add_student_email_page/cubit/add_student_email_page_cubit.dart'
    as _i22;
import '../ui/address_list_page/cubit/address_list_page_cubit.dart' as _i54;
import '../ui/all_promotions_page/cubit/all_promotions_page_cubit.dart' as _i55;
import '../ui/buy_gift_page/cubit/buy_gift_page_cubit.dart' as _i79;
import '../ui/checkout_page/cubit/checkout_page_cubit.dart' as _i80;
import '../ui/claim_free_promotion_page/cubit/claim_free_promotion_page_cubit.dart'
    as _i81;
import '../ui/claim_gift_page/cubit/claim_gift_page_cubit.dart' as _i82;
import '../ui/competition_page/cubit/competition_page_cubit.dart' as _i57;
import '../ui/contacts_page/cubit/contacts_page_cubit.dart' as _i58;
import '../ui/curation_detail_page/cubit/curation_detail_page_cubit.dart'
    as _i84;
import '../ui/earnings_page/cubit/earnings_page_cubit.dart' as _i61;
import '../ui/edit_product_page/cubit/edit_product_cubit.dart' as _i36;
import '../ui/feed_page/cubit/feed_page_cubit.dart' as _i62;
import '../ui/gifts_page/cubit/gifts_page_cubit.dart' as _i39;
import '../ui/google_map_page/cubit/google_map_cubit.dart' as _i63;
import '../ui/home_page/cubit/home_page_cubit.dart' as _i64;
import '../ui/leaderboard_page/cubit/leaderboard_page_cubit.dart' as _i40;
import '../ui/login_page/cubit/login_page_cubit.dart' as _i41;
import '../ui/loyalty_page/cubit/loyalty_page_cubit.dart' as _i65;
import '../ui/my_oders_page/cubit/my_orders_page_cubit.dart' as _i85;
import '../ui/onboard_page/cubit/onboard_page_cubit.dart' as _i66;
import '../ui/order_detail_page/cubit/order_detail_page_cubit.dart' as _i86;
import '../ui/payment_methods_page/cubit/payment_methods_page_cubit.dart'
    as _i68;
import '../ui/products_list_page/cubit/product_list_page_cubit.dart' as _i69;
import '../ui/profile_page/cubit/profile_page_cubit.dart' as _i43;
import '../ui/promotions_page/cubit/promotions_page_cubit.dart' as _i45;
import '../ui/referral_code_entry_page/bloc/referral_code_entry_page_bloc.dart'
    as _i70;
import '../ui/register_page/cubit/register_page_cubit.dart' as _i46;
import '../ui/reward_share_page/cubit/reward_share_page_cubit.dart' as _i71;
import '../ui/send_gift_page/cubit/send_gift_page_cubit.dart' as _i72;
import '../ui/store_details_page/cubit/store_details_page_cubit.dart' as _i74;
import '../ui/store_list_page/cubit/store_list_page_cubit.dart' as _i75;
import '../ui/transaction_page/cubit/transaction_cubit.dart' as _i76;
import '../ui/transfer_coin_page/cubit/transfer_coin_cubit.dart' as _i77;
import '../ui/verify_student_email_page/cubit/verify_student_email_page_cubit.dart'
    as _i20;
import '../ui/view_user_stores_page/cubit/view_user_stores_page_cubit.dart'
    as _i50;
import '../ui/wallet_page/cubit/wallet_page_cubit.dart' as _i78;
import 'injector.module.dart' as _i88;
import 'router.dart' as _i25; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.FirebaseAnalytics>(registerModule.analytics);
  gh.singleton<_i4.FirebaseAuth>(registerModule.auth);
  gh.singleton<_i5.FirebaseFirestore>(registerModule.firestore);
  gh.singleton<_i6.FirebaseFunctions>(registerModule.functions);
  gh.singleton<_i7.FirebaseMessaging>(registerModule.messaging);
  gh.factory<_i8.GiftsData>(() => _i8.GiftsData(get<_i5.FirebaseFirestore>()));
  gh.factory<_i9.GiftsUseCase>(() => _i9.GiftsUseCase(get<_i8.GiftsData>()));
  gh.factory<_i10.OrderData>(
      () => _i10.OrderData(get<_i5.FirebaseFirestore>()));
  gh.factory<_i11.ProductData>(() => _i11.ProductData(
        get<_i5.FirebaseFirestore>(),
        get<_i6.FirebaseFunctions>(),
      ));
  gh.factory<_i12.ProductUsecase>(
      () => _i12.ProductUsecase(get<_i11.ProductData>()));
  gh.factory<_i13.PromotionsData>(
      () => _i13.PromotionsData(get<_i5.FirebaseFirestore>()));
  gh.factory<_i14.SendGrid>(() => _i14.SendGrid(get<_i6.FirebaseFunctions>()));
  gh.factory<_i15.StoreDataFirebase>(
      () => _i15.StoreDataFirebase(get<_i5.FirebaseFirestore>()));
  gh.factory<_i16.StripeData>(
      () => _i16.StripeData(get<_i6.FirebaseFunctions>()));
  gh.factory<_i17.UserData>(() => _i17.UserData(get<_i5.FirebaseFirestore>()));
  gh.factory<_i18.UserLocationData>(
      () => _i18.UserLocationData(get<_i5.FirebaseFirestore>()));
  gh.factory<_i19.UserUseCase>(() => _i19.UserUseCase(
        get<_i14.SendGrid>(),
        get<_i17.UserData>(),
        get<_i18.UserLocationData>(),
      ));
  gh.factory<_i20.VerifyStudentEmailPageCubit>(
      () => _i20.VerifyStudentEmailPageCubit(get<_i19.UserUseCase>()));
  gh.lazySingleton<_i21.WalletData>(() => _i21.WalletData(
        get<_i5.FirebaseFirestore>(),
        get<_i4.FirebaseAuth>(),
      ));
  gh.factory<_i22.AddStudentEmailPageCubit>(
      () => _i22.AddStudentEmailPageCubit(get<_i19.UserUseCase>()));
  gh.factory<_i23.AddressData>(
      () => _i23.AddressData(get<_i5.FirebaseFirestore>()));
  gh.factory<_i24.AddressUseCases>(() => _i24.AddressUseCases(
        get<_i23.AddressData>(),
        get<_i17.UserData>(),
      ));
  gh.singleton<_i25.AppRouter>(_i25.AppRouter(get<_i4.FirebaseAuth>()));
  gh.factory<_i26.AuthData>(() => _i26.AuthData(
        get<_i5.FirebaseFirestore>(),
        get<_i4.FirebaseAuth>(),
      ));
  gh.factory<_i27.AuthUseCase>(() => _i27.AuthUseCase(
        get<_i26.AuthData>(),
        get<_i19.UserUseCase>(),
      ));
  gh.factory<_i28.CartData>(() => _i28.CartData(get<_i5.FirebaseFirestore>()));
  gh.factory<_i29.CartUseCases>(() => _i29.CartUseCases(get<_i28.CartData>()));
  gh.factory<_i30.CategoryData>(
      () => _i30.CategoryData(get<_i5.FirebaseFirestore>()));
  gh.factory<_i31.CategoryUseCase>(
      () => _i31.CategoryUseCase(get<_i30.CategoryData>()));
  gh.lazySingleton<_i32.CircleData>(
      () => _i32.CircleData(get<_i6.FirebaseFunctions>()));
  gh.factory<_i33.ContactsUseCase>(
      () => _i33.ContactsUseCase(get<_i17.UserData>()));
  gh.factory<_i34.CurationData>(
      () => _i34.CurationData(get<_i5.FirebaseFirestore>()));
  gh.factory<_i35.EarningsAndRewardUsagedata>(
      () => _i35.EarningsAndRewardUsagedata(get<_i5.FirebaseFirestore>()));
  gh.factoryParam<_i36.EditProductCubit, String, dynamic>((
    storeId,
    _,
  ) =>
      _i36.EditProductCubit(
        storeId,
        get<_i31.CategoryUseCase>(),
      ));
  gh.factory<_i37.FeedData>(() => _i37.FeedData(get<_i5.FirebaseFirestore>()));
  gh.factory<_i38.FeedUseCase>(() => _i38.FeedUseCase(get<_i37.FeedData>()));
  gh.factory<_i39.GiftsPageCubit>(
      () => _i39.GiftsPageCubit(get<_i9.GiftsUseCase>()));
  gh.factoryParam<_i40.LeaderboardPageCubit, String, dynamic>((
    _storeId,
    _,
  ) =>
      _i40.LeaderboardPageCubit(
        get<_i19.UserUseCase>(),
        _storeId,
      ));
  gh.factory<_i41.LoginPageCubit>(
      () => _i41.LoginPageCubit(get<_i27.AuthUseCase>()));
  gh.factory<_i42.PaymentUsecases>(() => _i42.PaymentUsecases(
        get<_i17.UserData>(),
        get<_i16.StripeData>(),
      ));
  gh.factory<_i43.ProfilePageCubit>(() => _i43.ProfilePageCubit(
        get<_i27.AuthUseCase>(),
        get<_i19.UserUseCase>(),
      ));
  gh.factory<_i44.PromotionUseCase>(() => _i44.PromotionUseCase(
        get<_i13.PromotionsData>(),
        get<_i10.OrderData>(),
      ));
  gh.factoryParam<_i45.PromotionsPageCubit, String, dynamic>((
    storeId,
    _,
  ) =>
      _i45.PromotionsPageCubit(
        get<_i44.PromotionUseCase>(),
        storeId,
      ));
  gh.factory<_i46.RegisterPageCubit>(
      () => _i46.RegisterPageCubit(get<_i19.UserUseCase>()));
  gh.lazySingleton<_i47.SelectedItemsBloc>(() => _i47.SelectedItemsBloc(
        get<_i24.AddressUseCases>(),
        get<_i42.PaymentUsecases>(),
      ));
  gh.factory<_i48.StoreUsecase>(() => _i48.StoreUsecase(
        get<_i15.StoreDataFirebase>(),
        get<_i34.CurationData>(),
      ));
  gh.lazySingleton<_i49.UserBloc>(() => _i49.UserBloc(
        get<_i27.AuthUseCase>(),
        get<_i19.UserUseCase>(),
        get<_i7.FirebaseMessaging>(),
      ));
  gh.factory<_i50.ViewUserStoresPageCubit>(() => _i50.ViewUserStoresPageCubit(
        get<_i48.StoreUsecase>(),
        get<_i19.UserUseCase>(),
      ));
  gh.lazySingleton<_i51.WalletUseCases>(() => _i51.WalletUseCasesImpl(
        get<_i32.CircleData>(),
        get<_i21.WalletData>(),
      ));
  gh.factory<_i52.AddAddressPageCubit>(
      () => _i52.AddAddressPageCubit(get<_i24.AddressUseCases>()));
  gh.factory<_i53.AddPaymentMethodsPageCubit>(
      () => _i53.AddPaymentMethodsPageCubit(get<_i42.PaymentUsecases>()));
  gh.factory<_i54.AddressListPageCubit>(
      () => _i54.AddressListPageCubit(get<_i24.AddressUseCases>()));
  gh.factory<_i55.AllPromotionsPageCubit>(
      () => _i55.AllPromotionsPageCubit(get<_i44.PromotionUseCase>()));
  gh.singleton<_i56.CartBloc>(_i56.CartBloc(get<_i29.CartUseCases>()));
  gh.factoryParam<_i57.CompetitionPageCubit, String, dynamic>((
    _storeId,
    _,
  ) =>
      _i57.CompetitionPageCubit(
        get<_i48.StoreUsecase>(),
        get<_i19.UserUseCase>(),
        _storeId,
      ));
  gh.factory<_i58.ContactsPageCubit>(
      () => _i58.ContactsPageCubit(get<_i33.ContactsUseCase>()));
  gh.factory<_i59.CurationUsecase>(() => _i59.CurationUsecase(
        get<_i34.CurationData>(),
        get<_i26.AuthData>(),
        get<_i48.StoreUsecase>(),
      ));
  gh.factory<_i60.EaringsAndRewardUsageUseCase>(() =>
      _i60.EaringsAndRewardUsageUseCase(
          get<_i35.EarningsAndRewardUsagedata>()));
  gh.factory<_i61.EarningsPageCubit>(() => _i61.EarningsPageCubit(
        get<_i60.EaringsAndRewardUsageUseCase>(),
        get<_i27.AuthUseCase>(),
      ));
  gh.factory<_i62.FeedPageCubit>(
      () => _i62.FeedPageCubit(get<_i38.FeedUseCase>()));
  gh.factory<_i63.GoogleMapCubit>(
      () => _i63.GoogleMapCubit(get<_i48.StoreUsecase>()));
  gh.factory<_i64.HomePageCubit>(() => _i64.HomePageCubit(
        get<_i59.CurationUsecase>(),
        get<_i48.StoreUsecase>(),
      ));
  gh.factoryParam<_i65.LoyaltyPageCubit, String, dynamic>((
    storeId,
    _,
  ) =>
      _i65.LoyaltyPageCubit(
        get<_i48.StoreUsecase>(),
        get<_i19.UserUseCase>(),
        storeId,
      ));
  gh.factoryParam<_i66.OnboardPageCubit, String, dynamic>((
    storeId,
    _,
  ) =>
      _i66.OnboardPageCubit(
        get<_i48.StoreUsecase>(),
        get<_i19.UserUseCase>(),
        storeId,
      ));
  gh.factory<_i67.OrderUseCase>(() => _i67.OrderUseCase(
        get<_i10.OrderData>(),
        get<_i42.PaymentUsecases>(),
        get<_i44.PromotionUseCase>(),
        get<_i35.EarningsAndRewardUsagedata>(),
      ));
  gh.factory<_i68.PaymentMethodsPageCubit>(
      () => _i68.PaymentMethodsPageCubit(get<_i42.PaymentUsecases>()));
  gh.factoryParam<_i69.ProductListPageCubit, String, String?>((
    _storeId,
    _referralCode,
  ) =>
      _i69.ProductListPageCubit(
        get<_i12.ProductUsecase>(),
        get<_i29.CartUseCases>(),
        _storeId,
        _referralCode,
        get<_i44.PromotionUseCase>(),
        get<_i19.UserUseCase>(),
        get<_i48.StoreUsecase>(),
      ));
  gh.factory<_i70.ReferralCodeEntryPageBloc>(
      () => _i70.ReferralCodeEntryPageBloc(
            get<_i48.StoreUsecase>(),
            get<_i59.CurationUsecase>(),
          ));
  gh.factoryParam<_i71.RewardSharePageCubit, String, dynamic>((
    storeId,
    _,
  ) =>
      _i71.RewardSharePageCubit(
        get<_i48.StoreUsecase>(),
        get<_i19.UserUseCase>(),
        storeId,
      ));
  gh.factory<_i72.SendGiftPageCubit>(() => _i72.SendGiftPageCubit(
        get<_i44.PromotionUseCase>(),
        get<_i19.UserUseCase>(),
        get<_i48.StoreUsecase>(),
        get<_i67.OrderUseCase>(),
      ));
  gh.singleton<_i73.StoreBloc>(_i73.StoreBloc(
    get<_i48.StoreUsecase>(),
    get<_i59.CurationUsecase>(),
  ));
  gh.factoryParam<_i74.StoreDetailsPageCubit, String, dynamic>((
    storeId,
    _,
  ) =>
      _i74.StoreDetailsPageCubit(
        storeId,
        get<_i48.StoreUsecase>(),
      ));
  gh.factory<_i75.StoreListPageCubit>(
      () => _i75.StoreListPageCubit(get<_i48.StoreUsecase>()));
  gh.factoryParam<_i76.TransactionCubit, String, dynamic>((
    id,
    _,
  ) =>
      _i76.TransactionCubit(
        get<_i51.WalletUseCases>(),
        id,
      ));
  gh.factory<_i77.TransferCoinCubit>(
      () => _i77.TransferCoinCubit(get<_i51.WalletUseCases>()));
  gh.lazySingleton<_i78.WalletPageCubit>(
      () => _i78.WalletPageCubit(get<_i51.WalletUseCases>()));
  gh.factory<_i79.BuyGiftPageCubit>(() => _i79.BuyGiftPageCubit(
        get<_i44.PromotionUseCase>(),
        get<_i19.UserUseCase>(),
        get<_i48.StoreUsecase>(),
        get<_i67.OrderUseCase>(),
      ));
  gh.factoryParam<_i80.CheckoutPageCubit, String, dynamic>((
    storeId,
    _,
  ) =>
      _i80.CheckoutPageCubit(
        storeId,
        get<_i67.OrderUseCase>(),
        get<_i44.PromotionUseCase>(),
        get<_i19.UserUseCase>(),
        get<_i48.StoreUsecase>(),
      ));
  gh.factoryParam<_i81.ClaimFreePromotionPageCubit, String, String>((
    _storeId,
    _promotionId,
  ) =>
      _i81.ClaimFreePromotionPageCubit(
        get<_i19.UserUseCase>(),
        get<_i67.OrderUseCase>(),
        get<_i44.PromotionUseCase>(),
        _storeId,
        _promotionId,
      ));
  gh.factoryParam<_i82.ClaimGiftPageCubit, String, dynamic>((
    _orderId,
    _,
  ) =>
      _i82.ClaimGiftPageCubit(
        get<_i67.OrderUseCase>(),
        get<_i9.GiftsUseCase>(),
        get<_i48.StoreUsecase>(),
        get<_i19.UserUseCase>(),
        _orderId,
      ));
  gh.singleton<_i83.CurationBloc>(
      _i83.CurationBloc(get<_i59.CurationUsecase>()));
  gh.factoryParam<_i84.CurationDetailPageCubit, String, dynamic>((
    curationId,
    _,
  ) =>
      _i84.CurationDetailPageCubit(
        get<_i59.CurationUsecase>(),
        curationId,
      ));
  gh.factory<_i85.MyOrdersPageCubit>(
      () => _i85.MyOrdersPageCubit(get<_i67.OrderUseCase>()));
  gh.factoryParam<_i86.OrderDetailPageCubit, _i87.Order?, String>((
    order,
    orderId,
  ) =>
      _i86.OrderDetailPageCubit(
        get<_i67.OrderUseCase>(),
        order,
        orderId,
      ));
  return get;
}

class _$RegisterModule extends _i88.RegisterModule {}
