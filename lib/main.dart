import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/portfolio_bloc.dart';
import 'package:portfolio/screens/portfolio_screen.dart';
import 'package:portfolio/util/shared_prefes_manager.dart';
import 'package:portfolio/util/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsManager.initializeSharedPrefs();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('fr')],
      path: 'assets/lang',
      fallbackLocale: const Locale('en'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PortfolioBloc>(
      create: (context) => PortfolioBloc()..add(GetPortfolioEvent()),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: Locale(SharedPrefsManager.getLanguage()),
        theme: ThemeClass.lightTheme,
        home: const PortfolioScreen(),
      ),
    );
  }
}
