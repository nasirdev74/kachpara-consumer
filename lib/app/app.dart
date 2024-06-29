import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kachpara/app/curation_bloc/curation_bloc.dart';
import 'package:kachpara/app/selected_items_bloc/selected_items_bloc.dart';
import 'package:kachpara/app/store_bloc/store_bloc.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/core/router.dart';
import 'package:kachpara/core/theme.dart';

import 'cart_bloc/cart_bloc.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final router = getIt<AppRouter>().router();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<UserBloc>(),
        ),
        BlocProvider(create: (context) => getIt<CurationBloc>()),
        BlocProvider(
          create: (context) => getIt<StoreBloc>(),
        ),
        BlocProvider(create: (context) => getIt<CartBloc>()),
        BlocProvider(create: (context) => getIt<SelectedItemsBloc>()),
      ],
      child: MaterialApp.router(
        title: 'KachPara',
        debugShowCheckedModeBanner: false,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        theme: theme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
