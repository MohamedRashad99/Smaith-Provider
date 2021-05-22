import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smith_resturant/Screens/Splash/view.dart';

import 'Screens/AddCar/Data/provider.dart';
import 'Screens/SignIn/provider.dart';
import 'Screens/sign_up/provider.dart';
import 'constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;

  runApp(
    MultiProvider(
      providers: [
        Provider<SignUpProvider>(create: (_) => SignUpProvider()),
        Provider<SignInProvider>(create: (_) => SignInProvider()),
        Provider<AddCarProvider>(create: (_) => AddCarProvider()),

      ],
      child: EasyLocalization(
        child: MyApp(),
        saveLocale: true,
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ar', 'EG'),
        ],
        path: 'lib/Resources/Translations',
      ),
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          canvasColor: Colors.transparent,
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: kBackgroundColor),
      home: SplashScrren(),
    );
  }
}
