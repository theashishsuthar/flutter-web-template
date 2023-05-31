// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:admin/app/router/routes.dart';
import 'package:admin/components/Screens/SplashScreen.dart';
import 'package:admin/components/Screens/dashboard/dashboard_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:provider/provider.dart';

import 'app/app.export.dart';
import 'app/constant/style.dart';
import 'app/controllers/MenuController.dart';
import 'app/theme/ThemeSetting.dart';
import 'app/theme/global_models_provider.dart';
import 'app/theme/settings_models_provider.dart';
import 'app/utils/route_observer.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'components/Screens/404/error.dart';
import 'components/Screens/authentication/authentication.dart';
import 'components/Screens/main/main_screen.dart';
import 'components/widgets/shared/layout.dart';

late KiwiContainer app;

TextDirection deviceTextDirection = TextDirection.ltr;

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: appTheme!.splashBgColor, // navigation bar color
    statusBarColor: appTheme!.splashBgColor, // status bar color
  ));

  //For charles api log

  if (kDebugMode && ApiConstants.apiLog) {
    rootBundle
        .load('assets/chls.pem')
        .then((value) => {
              if (value != null)
                {
                  SecurityContext.defaultContext
                      .setTrustedCertificatesBytes(value.buffer.asUint8List())
                }
            })
        // ignore: invalid_return_type_for_catch_error
        .catchError((object) => {print(object)});
  }
  WidgetsFlutterBinding.ensureInitialized();
  app = KiwiContainer();
  setup();

  runApp(SettingsModelsProvider(
    child: GlobalModelsProvider(
      child: StreamBuilder<String>(
          stream: ThemeHelper.appthemeString,
          builder: (context, snapshot) {
            return Base();
          }),
    ),
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  ThemeData? themeData;

  @override
  void initState() {
    super.initState();
    ThemeHelper.changeTheme("white");

    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => setState(() {
        themeData = AppTheme.of(context).theme;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: APPNAME,
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
      getPages: [
        GetPage(
            name: '/',
            page: () {
              return SiteLayout();
            })
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      navigatorKey: NavigationUtilities.key,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child: MainScreen(),
      ),
      onGenerateRoute: onGenerateRoute,

      navigatorObservers: [routeObserver],
      routes: <String, WidgetBuilder>{
        '/ThemeSetting': (BuildContext context) => ThemeSetting(),
      },
      // builder: _builder,
    );
  }

  Widget _builder(BuildContext context, Widget? child) {
    return Column(
      children: <Widget>[
        Expanded(child: child!),
      ],
    );
  }
}
