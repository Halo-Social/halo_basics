import 'package:flutter/cupertino.dart';
import 'abstract_color.dart';

class HLightColor implements HColor {
  @override
  bool isLightMode = true;

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
  Color colorInfo = const Color.fromRGBO(49, 128, 245, 1);
  @override
  Color colorWarn = const Color.fromRGBO(245, 143, 0, 1);
  @override
  Color colorError = const Color.fromRGBO(224, 56, 45, 1);

  @override
  Color colorInfo8 = const Color.fromRGBO(49, 128, 245, 0.08);
  @override
  Color colorWarn12 = const Color.fromRGBO(245, 143, 0, 0.12);
  @override
  Color colorError8 = const Color.fromRGBO(224, 56, 45, 0.08);

  @override
  Color colorSuccess = const Color.fromRGBO(51, 184, 78, 1);

  /// 背景颜色
  @override
  Color bgPrimary = const Color.fromRGBO(242, 244, 247, 1);
  @override
  Color bgSecondary = const Color.fromRGBO(255, 255, 255, 1);

  /// 浮出模块背景颜色
  @override
  Color bgEPrimary = const Color.fromRGBO(255, 255, 255, 1);
  @override
  Color bgESecondary = const Color.fromRGBO(255, 255, 255, 1);

  /// 分割颜色
  @override
  Color separatorOpaque = const Color.fromRGBO(112, 115, 122, 0.16);
  @override
  Color separatorInput = const Color.fromRGBO(211, 217, 229, 1);

  /// 填充颜色
  @override
  Color fillPrimary = const Color.fromRGBO(93, 103, 122, 0.08);
  @override
  Color colorWarnLight = const Color.fromRGBO(255, 243, 224, 1);

  /// 遮罩颜色
  @override
  Color overlay = const Color.fromRGBO(0, 0, 0, 0.4);
  @override
  Color toastOverlay = const Color.fromRGBO(62, 69, 82, 0.92);

  @override
  Color tcSecondary = const Color.fromRGBO(130, 136, 148, 1);
  @override
  Color tcTertiary = const Color.fromRGBO(175, 183, 190, 1);
  @override
  Color tcDarkGreen = const Color.fromRGBO(0, 143, 109, 1);

  @override
  Color tcTheme = const Color.fromRGBO(8, 194, 132, 1);
  @override
  Color tcRise = const Color.fromRGBO(8, 194, 132, 1);
  @override
  Color tcFall = const Color.fromRGBO(204, 57, 82, 1);

  /// 深色背景下button文字颜色
  @override
  Color tcOnButton = const Color.fromRGBO(255, 255, 255, 1);

  @override
  Color tcPrimary = const Color.fromRGBO(9, 9, 10, 1);

  @override
  Color shimmerBase = const Color.fromRGBO(242, 243, 244, 1);

  @override
  Color shimmerHighlight = const Color.fromRGBO(230, 232, 234, 1);

  @override
  Color fillInfo = const Color.fromRGBO(225, 235, 250, 0.8);

  @override
  Color paletteYellow = const Color.fromRGBO(225, 214, 51, 1);
}
