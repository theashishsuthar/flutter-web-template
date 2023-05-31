import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme_settings_model.dart';

/// Creates a [MultiProvider] with each settings model.
///
/// These models are above the root [MaterialApp] and are only created once.
class SettingsModelsProvider extends StatelessWidget {
  const SettingsModelsProvider({
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeSettingsModel>(
          create: (BuildContext context) {
            return ThemeSettingsModel();
          },
        )
      ],
      child: child,
    );
  }
}
