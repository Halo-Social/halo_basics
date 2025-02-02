import 'package:flutter/cupertino.dart';

class CustomBouncingScrollPhysics extends BouncingScrollPhysics {
  const CustomBouncingScrollPhysics({
    ScrollPhysics? parent,
  }) : super(parent: parent);

  @override
  CustomBouncingScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomBouncingScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  SpringDescription get spring {
    return SpringDescription.withDampingRatio(
      mass: 0.5,
      stiffness: 400.0,
      ratio: 1.1,
    );
  }
}

class CustomClampingScrollPhysics extends ClampingScrollPhysics {
  const CustomClampingScrollPhysics({
    ScrollPhysics? parent,
  }) : super(parent: parent);

  @override
  CustomClampingScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomClampingScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  SpringDescription get spring {
    return SpringDescription.withDampingRatio(
      mass: 0.5,
      stiffness: 400.0,
      ratio: 1.1,
    );
  }
}
