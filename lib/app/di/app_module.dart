import 'package:kiwi/kiwi.dart';

import '../app.export.dart';

part "app_module.g.dart";

abstract class AppModule {
  @Register.singleton(ConnectivityService)
  @Register.singleton(PrefUtils)
  @Register.singleton(ThemeSettingsModel)
  @Register.singleton(ServiceModule)
  @Register.singleton(CustomDialogs)
  void configure();
}

void setup() {
  var appModule = _$AppModule();
  appModule.configure();
}
