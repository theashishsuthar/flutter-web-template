import 'dart:ui';

import 'package:flutter/material.dart';

/// Slides its [child] into position upon creation.
class SlideInAnimation extends StatefulWidget {
  const SlideInAnimation({
    this.child,
    this.duration = const Duration(seconds: 1),
    this.delay = Duration.zero,
    this.offset = Offset.zero,
    this.curve = Curves.fastOutSlowIn,
  });

  final Widget? child;

  /// The duration of the animation.
  final Duration duration;

  /// The delay until the animation starts.
  final Duration delay;

  /// The offset that the child will have before it slides into position.
  final Offset offset;

  final Curve curve;

  @override
  _SlideInAnimationState createState() => _SlideInAnimationState();
}

class _SlideInAnimationState extends State<SlideInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _hidden = true;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addListener(() {
        if (mounted) setState(() {});
      });

    _animation = CurveTween(curve: widget.curve).animate(_controller);

    Future.delayed(widget.delay).then((_) {
      if (mounted) {
        _controller.forward();
        _hidden = false;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hidden) {
      return Container();
    } else {
      return Transform.translate(
        offset: Offset(
          (1 - _animation.value) * widget.offset.dx,
          (1 - _animation.value) * widget.offset.dy,
        ),
        child: widget.child,
      );
    }
  }
}

/// Slides and fades its child into position upon creation.
class SlideFadeInAnimation extends StatefulWidget {
  const SlideFadeInAnimation({
    this.child,
    Key? key,
    this.duration = const Duration(seconds: 1),
    this.delay = Duration.zero,
    this.offset = Offset.zero,
    this.curve = Curves.fastOutSlowIn,
  }) : super(key: key);

  /// The child to animate.
  final Widget? child;

  /// The duration of the animation.
  final Duration duration;

  /// The delay until the animation starts.
  final Duration delay;

  /// The offset that the child will have before it slides into position.
  final Offset offset;

  /// The curve used by the animation.
  final Curve curve;

  @override
  _SlideFadeInAnimationState createState() => _SlideFadeInAnimationState();
}

class _SlideFadeInAnimationState extends State<SlideFadeInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = CurveTween(curve: widget.curve).animate(_controller);

    Future.delayed(widget.delay).then((_) {
      if (mounted) _controller.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: Transform.translate(
            offset: Offset(
              (1 - _animation.value) * widget.offset.dx,
              (1 - _animation.value) * widget.offset.dy,
            ),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

/// Fades out its [child] upon creation.
class FadeOutWidget extends StatefulWidget {
  const FadeOutWidget({
    Key? key,
    this.child,
    this.duration = const Duration(milliseconds: 500),
  }) : super(key: key);

  final Widget? child;
  final Duration duration;

  @override
  _FadeOutWidgetState createState() => _FadeOutWidgetState();
}

class _FadeOutWidgetState extends State<FadeOutWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this)
      ..forward();
  }

  @override
  void deactivate() {
    _controller.stop();
    super.deactivate();
  }

  @override
  void didUpdateWidget(FadeOutWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.child != widget.child) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: 1 - _controller.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

/// A simple animation that "bounces in" its child.
class BounceInAnimation extends StatefulWidget {
  const BounceInAnimation({
    this.child,
    this.duration = const Duration(milliseconds: 1000),
    this.delay = Duration.zero,
  });

  final Widget? child;
  final Duration duration;
  final Duration delay;

  @override
  _BounceInAnimationState createState() => _BounceInAnimationState();
}

class _BounceInAnimationState extends State<BounceInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addListener(() {
        if (mounted) setState(() {});
      });

    _animation = CurveTween(curve: Curves.elasticOut).animate(_controller);

    Future.delayed(widget.delay).then((_) {
      if (mounted) _controller.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _animation.value,
      child: widget.child,
    );
  }
}

/// A widget that can be used to "slide away" its child by calling a method.
class SlideAnimation extends StatefulWidget {
  const SlideAnimation({
    this.child,
    this.endPosition,
    Key? key,
    this.duration = const Duration(milliseconds: 600),
  }) : super(key: key);

  final Widget? child;
  final Offset? endPosition;
  final Duration duration;

  @override
  SlideAnimationState createState() => SlideAnimationState();
}

class SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addListener(() {
        if (mounted) setState(() {});
      });

    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: widget.endPosition,
    ).animate(CurveTween(curve: Curves.easeInCubic).animate(_controller));

    super.initState();
  }

  Future<void> forward() {
    return _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: _animation.value,
      child: widget.child,
    );
  }
}

class StaggerdAnimation extends StatefulWidget {
  const StaggerdAnimation({Key? key}) : super(key: key);

  @override
  State<StaggerdAnimation> createState() => _StaggerdAnimationState();
}

class _StaggerdAnimationState extends State<StaggerdAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
