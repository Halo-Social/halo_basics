import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:halo_basics/halo_theme.dart';
import 'package:halo_basics/halo_widgets.dart';
import 'package:halo_basics/src/ui/widgets/dialog/bottom_sheet.dart';

enum HDialogBtnDirection { vertical, horizontal }

enum HDialogIconType { alert, warn, success }

const List<String> defalutIcons = [
  "packages/kc_widgets/assets/icon_alert.png",
  "packages/kc_widgets/assets/icon_warning.png",
  "packages/kc_widgets/assets/icon_success.png",
];

typedef OnHookMainButtonClick2 = Future<bool> Function();

class HDialogWidget extends StatefulWidget {
  HDialogWidget({
    Key? key,
    this.title,
    this.titleTextStyle,
    this.content,
    this.contentTextStyle,
    this.btnDirection = HDialogBtnDirection.vertical,
    this.dialogIconType,
    this.customIconWidget,
    this.onHookMainButtonBuilder,
    this.onHookMainButtonClick,
    this.mainButtonText,
    this.mainButtonBgColor,
    this.mainButtonTextColor,
    this.secondaryButtonTextColor,
    this.secondaryButtonText,
    this.secondaryButtonBgColor,
    this.onMainButtonClick,
    this.onSecondaryButtonClick,
    this.customContent,
    this.height,
  }) : super(key: key);
  final HDialogBtnDirection btnDirection;
  final HDialogIconType? dialogIconType;
  final String? title;
  final TextStyle? titleTextStyle;
  final String? content;
  final TextStyle? contentTextStyle;
  final String? mainButtonText;
  final Color? mainButtonTextColor;
  final Color? mainButtonBgColor;
  final String? secondaryButtonText;
  final Color? secondaryButtonTextColor;
  final Color? secondaryButtonBgColor;
  final VoidCallback? onMainButtonClick;
  final VoidCallback? onSecondaryButtonClick;
  final Widget? customContent;
  final Widget? customIconWidget;

  /// mainButton  拦截点击
  final OnHookMainButtonClick2? onHookMainButtonClick;

  /// mainButton  修改
  final WidgetBuilder? onHookMainButtonBuilder;

  final double? height;
  double? width;
  Decoration? decoration;

  @override
  State<HDialogWidget> createState() => _HDialogState();

  Future<dynamic> showNormal(BuildContext context) {
    final double screenWidth = window.physicalSize.width / window.devicePixelRatio;
    width = screenWidth - 55;
    decoration = BoxDecoration(
      color: HTheme.color.bgESecondary,
      borderRadius: const BorderRadius.all(Radius.circular(24)),
    );
    return showDialog(
        context: context,
        barrierDismissible: false,
        useRootNavigator: true,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: this,
          );
        });
  }

  Future<dynamic> showBottom(BuildContext context) {
    final double screenWidth = window.physicalSize.width / window.devicePixelRatio;
    width = screenWidth - 16;
    decoration = BoxDecoration(
      color: HTheme.color.bgESecondary,
      borderRadius: const BorderRadius.all(Radius.circular(24)),
    );
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useRootNavigator: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: this,
        );
      },
    );
  }

  Future<dynamic> showBottomFill(BuildContext context) {
    final double screenWidth = window.physicalSize.width / window.devicePixelRatio;
    width = screenWidth;
    return HBottomSheet.showModalBottomSheet(context: context, builder: (context) => this, useRootNavigator: true);
  }
}

class _HDialogState extends State<HDialogWidget> {
  /// 显示修改mainButton的内容
  bool? showHookMainButton;
  late ScrollController controller;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    List<Widget> widgets = [];

    /// icon
    if (widget.customIconWidget != null) {
      widgets.add(widget.customIconWidget!);
      widgets.add(const SizedBox(height: 24));
    } else {
      if (widget.dialogIconType != null) {
        widgets.add(Image.asset(defalutIcons[widget.dialogIconType!.index], width: 48, height: 48, fit: BoxFit.fill));
        widgets.add(const SizedBox(height: 24));
      }
    }

    /// 标题
    if (widget.title != null) {
      widgets.add(HText(
        widget.title!,
        textAlign: TextAlign.center,
        style: widget.titleTextStyle ?? HTextStyle.headLineBold.tcPrimary,
      ));
      widgets.add(const SizedBox(height: 8));
    }

    /// 自定义内容
    if (widget.customContent != null) {
      widgets.add(widget.customContent!);
    }

    /// 默认内容
    else if (widget.content != null) {
      widgets.add(HText(
        widget.content!,
        textAlign: TextAlign.center,
        style: widget.contentTextStyle ?? HTextStyle.cellOutRegular.tcSecondary,
      ));
      widgets.add(const SizedBox(height: 8));
    }

    widgets.add(const SizedBox(height: 16));

    widgets.add(_buildActionButtons(context));

    return SafeArea(
      child: UnconstrainedBox(
        child: Container(
          decoration: widget.decoration,
          height: widget.height,
          width: widget.width,
          padding: const EdgeInsets.all(24),
          child: Column(
            children: widgets,
          ),
        ),
      ),
    );
  }

  _buildActionButtons(BuildContext context) {
    if (widget.mainButtonText == null && widget.secondaryButtonText == null) {
      return const SizedBox();
    }

    List<Widget> btns = [];
    if (widget.mainButtonText != null) {
      btns.add(_buildPrimaryBtn());
    }
    if (widget.secondaryButtonText != null) {
      btns.add(_buildSecondaryBtn());
    }

    if (widget.btnDirection == HDialogBtnDirection.horizontal) {
      List<Widget> wrapBtns = [
        ...btns.reversed.map((e) {
          return Expanded(child: e);
        }).toList()
      ];
      if (wrapBtns.length > 1) wrapBtns.insert(1, const SizedBox(width: 12));
      return Row(children: wrapBtns);
    } else {
      if (btns.length > 1) btns.insert(1, const SizedBox(height: 8));
      return Column(children: btns);
    }
  }

  _buildPrimaryBtn() {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: TextButton(
        onPressed: () async {
          if (showHookMainButton == true) {
            return;
          }
          if (widget.onHookMainButtonBuilder != null && widget.onHookMainButtonClick != null) {
            setState(() => showHookMainButton = true);
            bool dismiss = await widget.onHookMainButtonClick!.call();
            if (dismiss) {
              Navigator.pop(context);
              widget.onMainButtonClick?.call();
            } else {
              setState(() => showHookMainButton = false);
            }
          } else {
            Navigator.pop(context);
            widget.onMainButtonClick?.call();
          }
        },
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
          backgroundColor: MaterialStateProperty.all(widget.mainButtonBgColor ?? HTheme.color.colorTheme),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
        ),
        child: Builder(builder: (BuildContext context) {
          if (showHookMainButton == true) {
            return widget.onHookMainButtonBuilder!.call(context);
          }
          return HText(
            widget.mainButtonText!,
            style: HTextStyle.bodyMedium.copyWith(color: widget.mainButtonTextColor ?? HTheme.color.tcOnButton),
          );
        }),
      ),
    );
  }

  _buildSecondaryBtn() {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          widget.onSecondaryButtonClick?.call();
          Navigator.pop(context);
        },
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
          backgroundColor: MaterialStateProperty.all(widget.secondaryButtonBgColor ?? HTheme.color.bgPrimary),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
        ),
        child: HText(
          widget.secondaryButtonText!,
          style: HTextStyle.bodyMedium.copyWith(color: widget.secondaryButtonTextColor ?? HTheme.color.tcTheme),
        ),
      ),
    );
  }
}
