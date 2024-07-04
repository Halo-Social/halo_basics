

import 'package:flutter/material.dart';

import 'color/abstract_color.dart';
import 'color/dark_color.dart';
import 'color/light_color.dart';

class HTheme {
  HTheme._();

  static final HTheme _ins = HTheme._();

  factory HTheme() => _ins;

  static ThemeMode currentMode = ThemeMode.light;

  static bool isLightMode = currentMode == ThemeMode.light;

  static bool isSystemThemeMode = true;

  static HColor darkColor = HDarkColor();
  static HColor lightColor = HLightColor();

  static HColor color = lightColor;
}

///常规的文本样式
class HTextStyle {
  HTextStyle._();

  static TextStyle get largeTitleRegular {
    return const TextStyle(fontWeight: FontWeight.normal, fontSize: 32, height: 1.25);
  }

  static TextStyle get title1Regular {
    return const TextStyle(fontWeight: FontWeight.normal, fontSize: 28, height: 1.25);
  }

  static TextStyle get title2Regular {
    return const TextStyle(fontWeight: FontWeight.normal, fontSize: 24, height: 1.25);
  }

  static TextStyle get title3Regular {
    return const TextStyle(fontWeight: FontWeight.normal, fontSize: 20, height: 1.25);
  }

  static TextStyle get headLineRegular {
    return const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, height: 1.294);
  }

  static TextStyle get bodyRegular {
    return const TextStyle(fontWeight: FontWeight.normal, fontSize: 17, height: 1.294);
  }

  static TextStyle get subHeadRegular {
    return const TextStyle(fontWeight: FontWeight.normal, fontSize: 16, height: 1.375);
  }

  static TextStyle get cellOutRegular {
    return const TextStyle(fontWeight: FontWeight.normal, fontSize: 15, height: 1.333);
  }

  static TextStyle get footnoteRegular {
    return const TextStyle(fontWeight: FontWeight.normal, fontSize: 13, height: 1.385);
  }

  static TextStyle get caption1Regular {
    return const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, height: 1.333);
  }

  static TextStyle get caption2Regular {
    return const TextStyle(fontWeight: FontWeight.normal, fontSize: 10, height: 1.2);
  }

  static FontWeight get mediumFontWeight {
    FontWeight f = FontWeight.w500;
    return f;
  }

  static TextStyle get largeTitleMedium {
    return largeTitleRegular.copyWith(fontWeight: mediumFontWeight);
  }

  static TextStyle get title1Medium {
    return title1Regular.copyWith(fontWeight: mediumFontWeight);
  }

  static TextStyle get title2Medium {
    return title2Regular.copyWith(fontWeight: mediumFontWeight);
  }

  static TextStyle get title3Medium {
    return title3Regular.copyWith(fontWeight: mediumFontWeight);
  }

  static TextStyle get headLineMedium {
    return headLineRegular.copyWith(fontWeight: mediumFontWeight);
  }

  static TextStyle get bodyMedium {
    return bodyRegular.copyWith(fontWeight: mediumFontWeight);
  }

  static TextStyle get subHeadMedium {
    return subHeadRegular.copyWith(fontWeight: mediumFontWeight);
  }

  static TextStyle get cellOutMedium {
    return cellOutRegular.copyWith(fontWeight: mediumFontWeight);
  }

  static TextStyle get footnoteMedium {
    return footnoteRegular.copyWith(fontWeight: mediumFontWeight);
  }

  static TextStyle get caption1Medium {
    return caption1Regular.copyWith(fontWeight: mediumFontWeight);
  }

  static TextStyle get caption2Medium {
    return caption2Regular.copyWith(fontWeight: mediumFontWeight);
  }

  static TextStyle get largeTitleBold {
    return largeTitleRegular.copyWith(fontWeight: FontWeight.bold);
  }

  static TextStyle get title1Bold {
    return title1Regular.copyWith(fontWeight: FontWeight.bold);
  }

  static TextStyle get title2Bold {
    return title2Regular.copyWith(fontWeight: FontWeight.bold);
  }

  static TextStyle get title3Bold {
    return title3Regular.copyWith(fontWeight: FontWeight.bold);
  }

  static TextStyle get headLineBold {
    return headLineRegular.copyWith(fontWeight: FontWeight.bold);
  }

  static TextStyle get bodyBold {
    return bodyRegular.copyWith(fontWeight: FontWeight.bold);
  }

  static TextStyle get subHeadBold {
    return subHeadRegular.copyWith(fontWeight: FontWeight.bold);
  }

  static TextStyle get cellOutBold {
    return cellOutRegular.copyWith(fontWeight: FontWeight.bold);
  }

  static TextStyle get footnoteBold {
    return footnoteRegular.copyWith(fontWeight: FontWeight.bold);
  }

  static TextStyle get caption1Bold {
    return caption1Regular.copyWith(fontWeight: FontWeight.bold);
  }

  static TextStyle get caption2Bold {
    return caption2Regular.copyWith(fontWeight: FontWeight.bold);
  }
}

extension TextStyleExt on TextStyle {
  TextStyle get tcPrimary => copyWith(color: HTheme.color.tcPrimary);

  TextStyle get tcPrimaryDark => copyWith(color: HTheme.darkColor.tcPrimary);

  TextStyle get tcSecondary => copyWith(color: HTheme.color.tcSecondary);

  TextStyle get tcTertiary => copyWith(color: HTheme.color.tcTertiary);

  TextStyle get tcOnButton => copyWith(color: HTheme.color.tcOnButton);

  TextStyle get tcTheme => copyWith(color: HTheme.color.tcTheme);

  TextStyle get tcError => copyWith(color: HTheme.color.colorError);

  TextStyle get tcWarn => copyWith(color: HTheme.color.colorWarn);

  TextStyle get tcRise => copyWith(color: HTheme.color.tcRise);
}
