import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import '../app.export.dart';
import 'math_utils.dart';

// ignore: must_be_immutable
class CommonTextfield extends StatefulWidget {
  final Widget? errodwidget;
  final String? label;
  final bool? isMandatory;
  final bool? isValidated;
  final TextFieldOption? textOption;
  final Function(String text)? textCallback;
  final VoidCallback? tapCallback;
  final VoidCallback? onNextPress;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  final bool showUnderLine;
  final bool enable;
  final BorderSide? border;
  final bool? autoFocus;
  final bool autoCorrect;
  final bool? alignment;
  bool? isObsecure;
  final bool? readOnly;
  final Function(String text)? validation;
  TextStyle? hintStyleText;
  final FocusNode? requestedFocusNode;
  Function? callback;
  final double? margin;

  CommonTextfield(
      {this.textOption,
      this.textCallback,
      this.isMandatory,
      this.label,
      this.isValidated,
      this.tapCallback,
      this.onNextPress,
      this.inputAction,
      this.autoFocus,
      this.focusNode,
      this.alignment,
      this.showUnderLine = true,
      this.enable = true,
      this.validation,
      this.autoCorrect = true,
      this.hintStyleText,
      this.errodwidget,
      this.readOnly,
      this.border,
      this.isObsecure,
      this.requestedFocusNode,
      this.callback,
      this.margin});

  @override
  _CommonTextfieldState createState() => _CommonTextfieldState();
}

class _CommonTextfieldState extends State<CommonTextfield> {
  bool obscureText = false;
  IconData obscureIcon = Icons.visibility;
  String obsecureImage = open_eye;
  TextStyle labelTextStyle = appTheme!.hintColor12Semibold;
  @override
  void initState() {
    super.initState();
    widget.focusNode!.addListener(() {
      setState(() {
        labelTextStyle = widget.focusNode!.hasFocus
            ? appTheme!.textColor14Medium
            : appTheme!.hintColor12Semibold;
      });
    });
    obscureText = widget.textOption!.isSecureTextField ?? false;
  }

  @override
  void didUpdateWidget(CommonTextfield oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: EdgeInsets.symmetric(
          horizontal: getSize(widget.margin ?? 20), vertical: getSize(10)),
      curve: Neumorphic.DEFAULT_CURVE,
      style: NeumorphicStyle(
          color: fromHex("#ECF0F2"),
          shape: NeumorphicShape.flat,
          boxShape:
              NeumorphicBoxShape.roundRect(BorderRadius.circular(getSize(50))),
          depth: -3,
          surfaceIntensity: getSize(30),
          lightSource: LightSource.topLeft,
          intensity: getSize(5),
          shadowLightColorEmboss: Colors.white.withOpacity(0.9)),
      child: Container(
        // height: getSize(85),
        // margin: EdgeInsets.symmetric(horizontal: getSize(widget.margin ?? 45)),
        // // decoration: BoxDecoration(
        // //   boxShadow: [
        // //     BoxShadow(
        // //       color: Colors.grey.withOpacity(0.2),
        // //       offset: const Offset(
        // //         2.0,
        // //         -20.0,
        // //       ),
        // //       blurRadius: 20.0,
        // //       spreadRadius: 5.5,
        // //     ), //BoxShadow
        // //     //BoxShadow
        // //   ],
        // // ),
        // decoration: ShapeDecoration(
        //   gradient: LinearGradient(
        //     colors: [fromHex("#EDF0F4").withOpacity(0.15), fromHex("#00000026")],
        //     begin: Alignment.topCenter,
        //     // transform:Transformer
        //     end: Alignment.bottomCenter,
        //     stops: const [
        //       0.0,
        //       0.13,
        //     ],
        //     tileMode: TileMode.clamp,
        //   ),
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(32.0)),
        //   ),
        // ),
        child: TextFormField(
          // scrollPadding: EdgeInsets.symmetric(vertical: getSize(15)),
          textAlignVertical: TextAlignVertical(y: 0.5),
          onTap: widget.callback as void Function()? ?? null,

          //textAlignVertical: TextAlignVertical.center,
          textCapitalization:
              widget.textOption!.keyboardType == TextInputType.text
                  ? TextCapitalization.sentences
                  : TextCapitalization.none,
          readOnly: widget.readOnly ?? false,
          autocorrect: widget.autoCorrect,
          obscuringCharacter: widget.textOption!.obSecureText ?? '∗',
          enabled: widget.enable,
          maxLines: widget.textOption!.maxLine,
          textInputAction: widget.inputAction ?? TextInputAction.done,
          focusNode: widget.focusNode ?? null,
          autofocus: widget.autoFocus ?? false,
          controller: widget.textOption!.inputController,
          obscureText: obscureText,

          style: appTheme!.textColor14Medium,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          // autovalidate: true,
          keyboardType: widget.textOption!.keyboardType ?? TextInputType.text,
          cursorColor: appTheme!.colorPrimary,
          inputFormatters: widget.textOption!.formatter ?? [],

          decoration: InputDecoration(
            isDense: false,
            errorStyle: appTheme!.text12RedMedium,
            contentPadding: EdgeInsets.symmetric(
                vertical: getSize(18), horizontal: getSize(20)),
            errorMaxLines: 2,
            // helperText: '',

            border: InputBorder.none,
            //  OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(35),
            //     borderSide: BorderSide(
            //         style: BorderStyle.solid,
            //         color: appTheme.redColor.withOpacity(0.5),
            //         width: getSize(0.5))),
            disabledBorder: InputBorder.none,
            //  OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(30),
            //     borderSide: BorderSide(
            //         style: BorderStyle.solid,
            //         color: appTheme.colorTextFieldBorder.withOpacity(0.5),
            //         width: getSize(0.5))),
            enabledBorder: InputBorder.none,
            // OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(25),
            //     borderSide: BorderSide(
            //         style: BorderStyle.solid,
            //         color: appTheme.colorTextFieldBorder,
            //         width: getSize(1))),

            focusedBorder: InputBorder.none,
            //  OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(25),
            //     borderSide: BorderSide(
            //         style: BorderStyle.solid,
            //         color: appTheme.colorPrimary,
            //         width: getSize(1))),
            // fillColor: widget.textOption.fillColor ?? appTheme.splashBgColor,
            filled: true,
            labelText: widget.textOption!.labelText,
            enabled: true,
            hintStyle:
                widget.textOption!.hintStyleText ?? appTheme!.textColor14Medium,
            hintText: widget.textOption!.hintText,
            // contentPadding: EdgeInsets.only(
            //     left: getSize(10), top: getSize(10), bottom: getSize(10)),
            labelStyle: widget.focusNode!.hasFocus
                ? appTheme!.text12PrimaryMedium
                : appTheme!.hintColor12Semibold,
            prefixIcon: widget.textOption!.prefixWid,
            suffixIcon: (widget.textOption!.isSecureTextField != null &&
                    widget.textOption!.isSecureTextField!)
                ? InkWell(
                    onTap: () {
                      setState(() {
                        this.obscureText = !this.obscureText;

                        if (this.obscureText) {
                          this.obsecureImage = open_eye;
                        } else {
                          this.obsecureImage = close_eye;
                        }
                        if (!widget.focusNode!.hasPrimaryFocus)
                          widget.focusNode!.canRequestFocus = false;
                        widget.focusNode!.unfocus();
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(getSize(18.5)),
                      height: getSize(1),
                      width: getSize(1),
                    ))
                // IconButton(
                //     icon: Icon(
                //       obscureIcon,
                //       color: appTheme.blackColor,
                //     ),
                //     onPressed: () {
                //       setState(() {
                //         this.obscureText = !this.obscureText;

                //         if (this.obscureText) {
                //           this.obscureIcon = Icons.visibility;
                //         } else {
                //           this.obscureIcon = Icons.visibility_off;
                //         }
                //         if (!widget.focusNode.hasPrimaryFocus)
                //           widget.focusNode.canRequestFocus = false;
                //         widget.focusNode.unfocus();
                //       });
                //       //TextInputConnection;
                //     },
                //   )
                : widget.textOption!.type == TextFieldType.DropDown
                    ?
                    // GestureDetector(
                    //     onTap: () {
                    //       //
                    //     },
                    //     child: Image.asset(rightAerrow,
                    //         height: getSize(12),
                    //         width: getSize(12),
                    //         color: ColorConstants.colorDarkBlue),
                    //   )
                    IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: appTheme!.grey,
                        ),
                        onPressed: () {},
                      )
                    : widget.textOption!.postfixWid,
          ),

          //     /*onSubmitted: (String text) {
          //       this.widget.textCallback(text);
          //       FocusScope.of(context).unfocus();
          //       if (widget.onNextPress != null) {
          //         widget.onNextPress();
          //       }
          // },*/
          onFieldSubmitted: (String text) {
            FocusScope.of(context).nextFocus();
            widget.focusNode!.unfocus();
            if (widget.onNextPress != null) {
              widget.onNextPress!();
            }
          },

          // validator: widget.validation,
          // onChanged: (String text) {
          //   this.widget.textCallback(text);
          // },

          onEditingComplete: () {
            this.widget.textCallback!(widget.textOption!.inputController!.text);
          },
        ),
      ),
    );
  }
}

class TextFieldOption {
  String? text = "";
  String? obSecureText;
  String? labelText;
  String? hintText;
  bool? isSecureTextField = false;
  TextInputType? keyboardType;
  TextFieldType? type;
  int maxLine;
  TextStyle? hintStyleText;
  Widget? prefixWid;
  Widget? postfixWid;
  bool? autoFocus;
  bool? enableInteractiveSelection;
  Color? fillColor;
  Padding? padding;
  InputBorder? errorBorder;
  List<TextInputFormatter>? formatter;
  TextEditingController? inputController;

  TextFieldOption(
      {this.text,
      this.labelText,
      this.hintText,
      this.isSecureTextField,
      this.keyboardType,
      this.type,
      this.maxLine = 1,
      this.autoFocus,
      this.formatter,
      this.hintStyleText,
      this.inputController,
      this.prefixWid,
      this.postfixWid,
      this.enableInteractiveSelection,
      this.padding,
      this.fillColor,
      this.errorBorder,
      this.obSecureText});
}

enum TextFieldType {
  Normal,
  DropDown,
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
