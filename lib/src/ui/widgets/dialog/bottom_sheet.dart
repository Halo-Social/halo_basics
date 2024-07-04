import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:halo_basics/halo_theme.dart';

class HBottomSheet {
  static Future<T?> showModalBottomSheet<T>({
    required material.BuildContext context,
    required material.WidgetBuilder builder,
    material.Color? backgroundColor,
    String? barrierLabel,
    double? elevation,
    material.ShapeBorder? shape,
    material.Clip? clipBehavior,
    material.BoxConstraints? constraints,
    material.Color? barrierColor,
    bool isScrollControlled = true,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    bool? showDragHandle,
    bool useSafeArea = false,
    material.RouteSettings? routeSettings,
    material.AnimationController? transitionAnimationController,
    material.Offset? anchorPoint,
  }) {
    var mq = material.MediaQuery.of(context);
    return material.showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return material.Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            material.Container(
              height: 20,
              alignment: Alignment.center,
              child: material.Container(
                decoration: material.BoxDecoration(
                  borderRadius: material.BorderRadius.circular(2.5),
                  color: HTheme.color.separatorInput,
                ),
                child: const material.SizedBox(
                  width: 36,
                  height: 5,
                ),
              ),
            ),
            material.Flexible(child: builder(ctx)),
          ],
        );
      },
      backgroundColor: backgroundColor ?? HTheme.color.bgESecondary,
      barrierLabel: barrierLabel,
      elevation: elevation,
      shape: shape ??
          const material.RoundedRectangleBorder(
            borderRadius: material.BorderRadius.only(
              topLeft: material.Radius.circular(20),
              topRight: material.Radius.circular(20),
            ),
          ),
      clipBehavior: clipBehavior ?? material.Clip.hardEdge,
      constraints: constraints ?? material.BoxConstraints(minHeight: 40, maxHeight: mq.size.height - 72),
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      useSafeArea: useSafeArea,
      routeSettings: routeSettings,
      transitionAnimationController: transitionAnimationController,
      anchorPoint: anchorPoint,
    );
  }
}
