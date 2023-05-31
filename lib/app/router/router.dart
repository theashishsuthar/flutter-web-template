import 'package:admin/app/router/routes.dart';
import 'package:flutter/material.dart';

import '../../components/Screens/clients/clients.dart';
import '../../components/Screens/drivers/drivers.dart';
import '../../components/Screens/overview/overview.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(OverviewPage());
    case driversPageRoute:
      return _getPageRoute(DriversPage());
    case clientsPageRoute:
      return _getPageRoute(ClientsPage());
    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
