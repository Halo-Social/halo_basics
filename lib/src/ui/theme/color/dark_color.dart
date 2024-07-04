import 'package:flutter/cupertino.dart';
import 'abstract_color.dart';

class HDarkColor implements HColor {
  @override
  bool isLightMode = false;

  @override
  Color colorBrand = const Color.fromRGBO(8, 209, 142, 1);

  @override
  Color colorTheme = const Color.fromRGBO(8, 194, 132, 1);

  @override
  Color colorTheme8 = const Color.fromRGBO(8, 194, 132, 0.08);

  @override
  Color colorRise = const Color.fromRGBO(8, 194, 132, 1);
  @override
  Color colorFall = const Color.fromRGBO(204, 57, 82, 1);

  /// 状态颜色
  @override
  Color colorInfo = const Color.fromRGBO(61, 139, 255, 1);
  @override
  Color colorWarn = const Color.fromRGBO(255, 157, 10, 1);
  @override
  Color colorError = const Color.fromRGBO(245, 79, 69, 1);

  @override
  Color colorInfo8 = const Color.fromRGBO(61, 139, 255, 0.08);
  @override
  Color colorWarn12 = const Color.fromRGBO(255, 157, 10, 0.12);
  @override
  Color colorError8 = const Color.fromRGBO(245, 79, 69, 0.08);

  @override
  Color colorSuccess = const Color.fromRGBO(57, 204, 86, 1);

  /// 背景颜色
  @override
  Color bgPrimary = const Color.fromRGBO(14, 16, 20, 1);
  @override
  Color bgSecondary = const Color.fromRGBO(24, 28, 36, 1);

  /// 浮出模块背景颜色
  @override
  Color bgEPrimary = const Color.fromRGBO(31, 36, 46, 1);
  @override
  Color bgESecondary = const Color.fromRGBO(42, 48, 61, 1);

  /// 分割颜色
  @override
  Color separatorOpaque = const Color.fromRGBO(112, 115, 122, 0.4);
  @override
  Color separatorInput = const Color.fromRGBO(70, 84, 92, 1);

  /// 填充颜色
  @override
  Color fillPrimary = const Color.fromRGBO(109, 120, 143, 0.24);
  @override
  Color colorWarnLight = const Color.fromRGBO(255, 243, 224, 1);

  /// 遮罩颜色
  @override
  Color overlay = const Color.fromRGBO(31, 31, 31, 0.8);
  @override
  Color toastOverlay = const Color.fromRGBO(62, 69, 82, 0.92);

  @override
  Color tcSecondary = const Color.fromRGBO(129, 137, 153, 1);
  @override
  Color tcTertiary = const Color.fromRGBO(73, 80, 92, 1);
  @override
  Color tcDarkGreen = const Color.fromRGBO(0, 143, 109, 1);

  @override
  Color tcTheme = const Color.fromRGBO(8, 194, 132, 1);
  @override
  Color tcRise = const Color.fromRGBO(8, 194, 132, 1);
  @override
  Color tcFall = const Color.fromRGBO(229, 64, 92, 1);

  /// 深色背景下button文字颜色
  @override
  Color tcOnButton = const Color.fromRGBO(23, 24, 26, 1);

  @override
  Color tcPrimary = const Color.fromRGBO(245, 250, 250, 1);

  @override
  Color shimmerBase = const Color.fromRGBO(40, 46, 56, 1);

  @override
  Color shimmerHighlight = const Color.fromRGBO(44, 50, 61, 1);

  @override
  Color fillInfo = const Color.fromRGBO(33, 46, 66, 0.8);

  @override
  Color paletteYellow = const Color.fromRGBO(225, 214, 51, 1);
}
