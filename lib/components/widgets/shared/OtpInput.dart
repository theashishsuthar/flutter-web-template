import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../app/app.export.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final FocusNode _previousFocus;
  const OtpInput(this.controller, this.autoFocus, this._previousFocus,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 69,
      width: 56,
      child: Neumorphic(
        style: NeumorphicStyle(
            color: fromHex("#ECF0F2"),
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(getSize(20))),
            depth: -3,
            surfaceIntensity: getSize(30),
            lightSource: LightSource.topLeft,
            intensity: getSize(5),
            shadowLightColorEmboss: Colors.white.withOpacity(0.9)),
        child: TextField(
          autofocus: autoFocus,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: controller,
          maxLength: 1,
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(getSize(20)),
              border: InputBorder.none,
              counterText: '',
              hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
          onChanged: (value) {
            if (value.isEmpty) {
              FocusScope.of(context).previousFocus();
            }
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}
