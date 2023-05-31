import 'package:flutter/material.dart';
import 'package:admin/app/app.export.dart';

/// Builds a background with a gradient from top to bottom.
///
/// The [colors] default to the [AppTheme.backgroundColors] if omitted.
class AppBackground extends StatelessWidget {
  const AppBackground({
    this.child,
    this.colors,
    this.borderRadius,
  });

  final Widget? child;
  final List<Color>? colors;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);

    final backgroundColors = colors ?? appTheme.backgroundColors!;

    if (backgroundColors.length == 1) {
      backgroundColors.add(backgroundColors.first);
    }

    return Container(
      child: Stack(
        children: [
          Image.asset(
            screenBG,
            width: MathUtilities.screenWidth(context),
            height: MathUtilities.screenHeight(context),
            fit: BoxFit.cover,
          ),
          AnimatedContainer(
            duration: kThemeAnimationDuration,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: colors ?? appTheme.backgroundColors as List<Color>,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: Directionality(
                  textDirection: deviceTextDirection,
                  child: child ?? Container()),
            ),
          ),
        ],
      ),
    );

    // return AnimatedContainer(
    //   duration: kThemeAnimationDuration,
    //   decoration: BoxDecoration(
    //     borderRadius: borderRadius,
    //     gradient: LinearGradient(
    //       begin: Alignment.topLeft,
    //       end: Alignment.bottomRight,
    //       colors: colors ?? appTheme.backgroundColors,
    //     ),
    //   ),
    //   child: Material(
    //     color: Colors.transparent,
    //     child: Directionality(
    //         textDirection: deviceTextDirection, child: child ?? Container()),
    //   ),
    // );
  }
}
