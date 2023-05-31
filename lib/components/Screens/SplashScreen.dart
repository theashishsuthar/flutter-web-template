import 'package:admin/app/AppConfiguration/AppNavigation.dart';
import 'package:admin/app/app.export.dart';
import 'package:admin/components/widgets/shared/CustomWidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const route = 'splash';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    nextFromSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme!.splashBgColor,
      // appBar: CustomWidget().getApp('title', () {}, Icons.arrow_back),
      body: Center(
        child: SlideFadeInAnimation(
          duration: const Duration(milliseconds: 1200),
          delay: Duration.zero,
          offset: const Offset(0, 75),
          curve: Curves.easeOutCubic,
          child: Center(
            child: Padding(
                padding: EdgeInsets.only(left: getSize(70), right: getSize(70)),
                child: Image.asset(
                  logo,
                  height: getSize(100),
                )),
          ),
        ),
      ),
    );
  }

  void nextFromSplash() {}
}
