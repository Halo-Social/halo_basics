import 'package:flutter/material.dart';

import '../dialog/bottom_sheet.dart';

typedef BoolFunc = bool Function();

extension WidgetExt on Widget {
  Widget extStyle({
    Color? bgColor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Offset? offset,
    double? height,
    double? width,
  }) {
    var current = this;
    if (offset != null) {
      current = Transform.translate(offset: offset, child: current);
    }
    return Container(
      height: height,
      width: width,
      color: bgColor,
      padding: padding,
      margin: margin,
      child: current,
    );
  }

  Widget positioned({double? left, double? top, double? right, double? bottom}) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: this,
    );
  }

  Widget onTap(GestureTapCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: this,
    );
  }

  Widget onTalInkWall(GestureTapCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: this,
    );
  }

  Widget onVisible(BoolFunc func) {
    var visible = func.call();
    return Visibility(visible: visible, child: this);
  }

  Widget onOffstage(BoolFunc func) {
    var offstage = func.call();
    return Offstage(offstage: offstage, child: this);
  }

  Widget wrapSliverFillRemaining() {
    return SliverFillRemaining(child: this);
  }

  Widget wrapSliverToBoxAdapter() {
    return SliverToBoxAdapter(child: this);
  }

  Future<T?> showHaloModalBottomSheetForTrade<T>(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return HBottomSheet.showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      constraints: BoxConstraints(maxHeight: 594 + queryData.viewPadding.bottom),
      builder: (ctx) => this,
    );
  }

  Future<T?> showHaloModalBottomSheet<T>(BuildContext context, {BoxConstraints? constraints}) {
    return HBottomSheet.showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      constraints: constraints,
      builder: (ctx) => this,
    );
  }
}

extension ChildrenExt on List<Widget> {
  Row toRow() {
    return Row(
      children: this,
    );
  }

  Column toColumn() {
    return Column(
      children: this,
    );
  }
}
