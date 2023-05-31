import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../app.export.dart';
import '../constant/FontConstant.dart';

Future showAlertDialogue(BuildContext context, String title, String message,
    {String buttonTitle = "Try Again", VoidCallback? onPressed}) {
  return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            content: Container(
              width: MediaQuery.of(context).size.width - 50,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(title, style: appTheme!.textColor16Normal),
                  Padding(
                    padding: EdgeInsets.only(
                        top: getSize(10),
                        left: getSize(10),
                        right: getSize(10),
                        bottom: getSize(25)),
                    child: Text(
                      message,
                      style: appTheme!.textColor16Grey,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: getSize(44),
                    child: AppButton.flat(
                      onTap: onPressed ?? () => Navigator.pop(context),
                      backgroundColor: appTheme!.colorPrimary,
                      borderRadius: 8,
                      text: buttonTitle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

List<BoxShadow> getBoxShadow(BuildContext context) {
  return [
    BoxShadow(
        color: appTheme!.shadowColor,
        blurRadius: getSize(13),
        spreadRadius: getSize(5))
  ];
}

getTitleText(
  BuildContext context,
  String text, {
  Color? color,
  double? fontSize,
  TextAlign alignment = TextAlign.left,
  FontWeight? fontweight,
  Overflow? overflow,
}) {
  return Text(
    text,
    style: AppTheme.of(context).theme.textTheme.bodyText1!.copyWith(
          color: color,
          fontFamily: Regular,
          wordSpacing: 1.5,
          fontSize: fontSize == null ? getSize(16) : fontSize,
          fontWeight: fontweight == null ? FontWeight.w600 : fontweight,
        ),
    textAlign: alignment,
  );
}
