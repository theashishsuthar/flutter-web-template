import 'package:admin/app/utils/CommonWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../app/app.export.dart';

abstract class StatefulScreenWidget extends StatefulWidget {
  StatefulScreenWidget({
    Key? key,
  }) : super(key: key);

  // get visaModel => null;
}

abstract class StatefulScreenWidgetState extends State<StatefulScreenWidget> {
  @override
  void initState() {
    super.initState();
  }

  Widget getBackGoundImage() {
    return Image.asset(
      screenBG,
      width: MathUtilities.screenWidth(context),
      height: MathUtilities.screenHeight(context),
      fit: BoxFit.cover,
    );
  }

  Widget getGradientImageBackGround() {
    return Image.asset(
      splashBG,
      width: MathUtilities.screenWidth(context),
      height: MathUtilities.screenHeight(context),
      fit: BoxFit.cover,
    );
  }

  double getTopPadding() {
    return getSize(124);
  }

  double? getTotalHeight() {
    return MathUtilities.screenHeight(context) - getTopPadding();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground();
  }
}
