import 'package:admin/app/app.export.dart';

import '../../components/widgets/shared/layout.dart';

class AppNavigation {
  static final AppNavigation shared = AppNavigation();

  void nextFromLogin() {
    NavigationUtilities.pushRoute(SiteLayout.route);
  }
}
