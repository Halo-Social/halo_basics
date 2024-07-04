import 'package:flutter/material.dart';

abstract class HColor {
  // KcAbstractColor();

  late bool isLightMode = true;

  /// 基础颜色
  late Color colorBrand;
  late Color colorTheme;
  late Color colorTheme8;
  late Color colorRise;
  late Color colorFall;

  /// 状态颜色
  late Color colorInfo;
  late Color colorWarn;
  late Color colorError;
  late Color colorInfo8;
  late Color colorWarn12;
  late Color colorError8;
  late Color colorSuccess;

  /// 背景颜色
  late Color bgPrimary;
  late Color bgSecondary;

  /// 浮出模块背景颜色
  late Color bgEPrimary;
  late Color bgESecondary;

  /// 分割颜色
  late Color separatorOpaque;
  late Color separatorInput;

  /// 填充颜色
  late Color fillPrimary;
  late Color colorWarnLight;

  /// 遮罩颜色
  late Color overlay;
  late Color toastOverlay;

  late Color tcSecondary;
  late Color tcTertiary;
  late Color tcDarkGreen;

  late Color tcTheme = colorTheme;
  late Color tcRise = colorRise;
  late Color tcFall = colorFall;

  /// 深色背景下button文字颜色
  late Color tcOnButton;

  /// 文本颜色
  late Color tcPrimary;

  late Color shimmerBase;
  late Color shimmerHighlight;

  late Color fillInfo;

  late Color paletteYellow;
}
