import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache.dart';
import 'package:flutter/material.dart';

class FlareIcon extends StatelessWidget {
  const FlareIcon({
    this.fileName,
    this.size = 18,
    this.sizeDifference = 0,
    this.offset = Offset.zero,
    this.animation,
    this.color,
  });

  /*/// An animated favorite icon used by [FavoriteButton].
  const FlareIcon.favorite({
     String animation,
    double size = 18,
    Color color,
  }) : this(
          fileName: "$_path/favorite.flr",
          size: size,
          sizeDifference: -0.5,
          animation: animation,
          color: color,
        );
*/
  /* /// An animated shining star icon used by [ProFeatureDialog].
  const FlareIcon.shiningStar({
    double size = 18,
    Offset offset = Offset.zero,
  }) : this(
          fileName: "$_path/shining_star.flr",
          size: size,
          offset: offset,
          animation: "shining",
        );
*/
  const FlareIcon.bottomBuildings({
    double size = 18,
    bool animate = false,
    Offset offset = Offset.zero,
  }) : this(
          fileName: "$_path/buildings.flr",
          size: size,
          sizeDifference: 0,
          offset: offset,
          animation: animate ? "parallax" : null,
        );

  const FlareIcon.loader({
    double size = 18,
    bool animate = false,
    Offset offset = Offset.zero,
  }) : this(
          fileName: "$_path/loader.flr",
          size: size,
          sizeDifference: 14,
          offset: offset,
          animation: animate ? "play" : null,
        );

  static const String _path = "assets/flare";

  /// The path of the flare asset file.
  final String? fileName;

  /// The size is used with the [sizeDifference] to calculate the size of the
  /// container.
  final double size;

  /// The size difference is used to have the flare icon with a given size
  /// appear the same as material icons with the same size.
  final double sizeDifference;

  /// Used to transform the icon using a translation.
  final Offset offset;

  /// The name of the animation that should play.
  final String? animation;

  /// If set the color will overwrite the icon color.
  final Color? color;

  double get _calculatedSize => size + sizeDifference;

  /// Loads the icons and adds them into the cache to make sure a widget
  /// using a [FlareIcon] doesn't appear blank for a few frames when it
  /// builds for the first time.
  static void cacheIcons(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: SizedBox(
        width: _calculatedSize,
        height: _calculatedSize,
        child: FlareActor(
          fileName,
          animation: animation,
          color: color,
        ),
      ),
    );
  }
}
