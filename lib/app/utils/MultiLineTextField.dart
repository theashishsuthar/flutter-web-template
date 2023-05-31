import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app.export.dart';

class MultiLineTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;

  MultiLineTextField(
      {this.controller, this.focusNode, this.labelText, this.hintText});

  @override
  _MultiLineTextFieldState createState() => _MultiLineTextFieldState();
}

class _MultiLineTextFieldState extends State<MultiLineTextField> {
  TextStyle labelTextStyle = appTheme!.hintColor12Semibold;
  @override
  void initState() {
    widget.focusNode!.addListener(() {
      setState(() {
        labelTextStyle = widget.focusNode!.hasFocus
            ? appTheme!.textPrimary14Semibold
            : appTheme!.hintColor12Semibold;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: getSize(123),
        child: TextFormField(
          controller: widget.controller,
          style: appTheme!.accountTextColor14Light,
          keyboardType: TextInputType.multiline,
          focusNode: widget.focusNode,
          maxLines: 5,
          inputFormatters: [
            
          ],
          decoration: new InputDecoration(
              labelText: widget.labelText,
              alignLabelWithHint: true,
              labelStyle: labelTextStyle,
              hintText: widget.hintText,
              hintStyle: appTheme!.text14IntroGreyText,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: appTheme!.redColor.withOpacity(0.5),
                      width: getSize(0.5))),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: appTheme!.colorTextFieldBorder.withOpacity(0.5),
                      width: getSize(0.5))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: appTheme!.colorTextFieldBorder,
                      width: getSize(1))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: appTheme!.colorPrimary,
                      width: getSize(1))),
              contentPadding: EdgeInsets.all(getSize(15))),
        ));
  }
}
