import 'package:flutter/cupertino.dart';

import '../constant/controllers.dart';
import '../router/router.dart';
import '../router/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: overviewPageRoute,
    );
