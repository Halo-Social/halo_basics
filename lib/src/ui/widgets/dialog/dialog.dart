import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'dialog_widget.dart';

enum HDialogPosition {
  middle,
  bottom,
  bottomFill,
}

// 例子
// HDialog.show(context,
//       position: HDialogPosition.bottom,
//       title: '标题',
//       content: '内容内容内容内容内容内容内容内容',
//       mainButtonText: '主要按钮',
//       secondaryButtonText: '次要按钮', onMainButtonClick: () {
//     print('主按钮点击');
//   }, onSecondaryButtonClick: () {
//     print('副按钮点击');
//   });
class HDialog {
  static Future<dynamic> show(
    BuildContext context, {
    String? title,
    String? content,
    required String mainButtonText,
    String? secondaryButtonText,
    VoidCallback? onMainButtonClick,
    VoidCallback? onSecondaryButtonClick,
    OnHookMainButtonClick2? onHookMainButtonClick,
    WidgetBuilder? onHookMainButtonBuilder,
    HDialogPosition? position = HDialogPosition.middle,
    HDialogIconType? dialogIconType,
    HDialogBtnDirection btnDirection = HDialogBtnDirection.vertical,
    Widget? customIconWidget,
    bool dismissWhenEnterBackground = false,
    bool noMainStyle = false,
    Color? mainButtonTextColor,
    Color? mainButtonBgColor,
    Color? secondaryButtonBgColor,
    Color? secondaryButtonTextColor,
    TextAlign? contentTextAlign,
    Color? backgroundColor,
    TextStyle? titleTextStyle,
    TextStyle? contentTextStyle,
    Widget? customContent,
    double height = 200,
  }) {
    var dialog = HDialogWidget(
      title: title,
      titleTextStyle: titleTextStyle,
      content: content,
      contentTextStyle: contentTextStyle,
      dialogIconType: dialogIconType,
      customContent: customContent,
      mainButtonText: mainButtonText,
      mainButtonTextColor: mainButtonTextColor,
      mainButtonBgColor: mainButtonBgColor,
      onHookMainButtonBuilder: onHookMainButtonBuilder,
      onHookMainButtonClick: onHookMainButtonClick,
      secondaryButtonText: secondaryButtonText,
      secondaryButtonTextColor: secondaryButtonTextColor,
      secondaryButtonBgColor: secondaryButtonBgColor,
      onMainButtonClick: onMainButtonClick,
      onSecondaryButtonClick: onSecondaryButtonClick,
      btnDirection: btnDirection,
      customIconWidget: customIconWidget,
    );
    switch(position) {
      case HDialogPosition.middle:
        return dialog.showNormal(context);
      case HDialogPosition.bottom:
        return dialog.showBottom(context);
      case HDialogPosition.bottomFill:
        return dialog.showBottomFill(context);
      case null:
        return dialog.showBottom(context);
    }
  }
}
