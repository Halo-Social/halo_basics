import 'package:flutter/cupertino.dart';

class HContainer extends Container {
  final Decoration? backgroundDecoration;

  HContainer({
    super.key,
    super.alignment,
    super.padding,
    super.color,
    super.decoration,
    this.backgroundDecoration,
    super.foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    super.margin,
    super.transform,
    super.transformAlignment,
    super.child,
    super.clipBehavior = Clip.none,
  }) : super(width: width, height: height, constraints: constraints);


  EdgeInsetsGeometry? get _paddingIncludingDecoration {
    if (decoration == null || decoration!.padding == null) {
      return padding;
    }
    final EdgeInsetsGeometry? decorationPadding = decoration!.padding;
    if (padding == null) {
      return decorationPadding;
    }
    return padding!.add(decorationPadding!);
  }

  @override
  Widget build(BuildContext context) {
    Widget? current = child;

    if (child == null && (constraints == null || !constraints!.isTight)) {
      current = LimitedBox(
        maxWidth: 0.0,
        maxHeight: 0.0,
        child: ConstrainedBox(constraints: const BoxConstraints.expand()),
      );
    } else if (alignment != null) {
      current = Align(alignment: alignment!, child: current);
    }

    final EdgeInsetsGeometry? effectivePadding = _paddingIncludingDecoration;
    if (effectivePadding != null) {
      current = Padding(padding: effectivePadding, child: current);
    }

    if (color != null) {
      current = ColoredBox(color: color!, child: current);
    }

    if (clipBehavior != Clip.none) {
      assert(decoration != null);
      current = ClipPath(
        clipper: _DecorationClipper(
          textDirection: Directionality.maybeOf(context),
          decoration: decoration!,
        ),
        clipBehavior: clipBehavior,
        child: current,
      );
    }

    if (backgroundDecoration != null) {
      current = DecoratedBox(
        decoration: backgroundDecoration!,
        position: DecorationPosition.background,
        child: current,
      );
    }

    if (decoration != null) {
      current = DecoratedBox(decoration: decoration!, child: current);
    }

    if (foregroundDecoration != null) {
      current = DecoratedBox(
        decoration: foregroundDecoration!,
        position: DecorationPosition.foreground,
        child: current,
      );
    }

    if (constraints != null) {
      current = ConstrainedBox(constraints: constraints!, child: current);
    }

    if (margin != null) {
      current = Padding(padding: margin!, child: current);
    }

    if (transform != null) {
      current = Transform(transform: transform!, alignment: transformAlignment, child: current);
    }

    return current!;
  }
}

/// A clipper that uses [Decoration.getClipPath] to clip.
class _DecorationClipper extends CustomClipper<Path> {
  _DecorationClipper({
    TextDirection? textDirection,
    required this.decoration,
  }) : assert(decoration != null),
        textDirection = textDirection ?? TextDirection.ltr;

  final TextDirection textDirection;
  final Decoration decoration;

  @override
  Path getClip(Size size) {
    return decoration.getClipPath(Offset.zero & size, textDirection);
  }

  @override
  bool shouldReclip(_DecorationClipper oldClipper) {
    return oldClipper.decoration != decoration
        || oldClipper.textDirection != textDirection;
  }
}
