import 'package:admin/components/widgets/shared/large_screen.dart';
import 'package:admin/components/widgets/shared/top_nav.dart';
import 'package:flutter/material.dart';

import '../../../app/helper/local_navigator.dart';
import '../../../app/helper/reponsiveness.dart';
import '../../Screens/main/components/side_menu.dart';

class SiteLayout extends StatelessWidget {
  static const route = 'site-layout';
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: Drawer(
        child: SideMenu(),
      ),
      body: ResponsiveWidget(
          largeScreen: LargeScreen(),
          smallScreen: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: localNavigator(),
          )),
    );
  }
}
