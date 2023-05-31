import 'package:flutter/material.dart';
import '../../../app/helper/local_navigator.dart';
import '../../../app/helper/reponsiveness.dart';
import '../../Screens/main/components/side_menu.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: SideMenu()),
        Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: localNavigator(),
            ))
      ],
    );
  }
}
