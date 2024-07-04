import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:halo_basics/halo_extension.dart';

class ScaleStyle {
  final double minFontSize;
  final double maxFontSize;
  final double stepGranularity;
  final AutoSizeGroup? group;
  final List<double>? presetFontSizes;

  ScaleStyle({
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.stepGranularity = 0.5,
    this.group,
    this.presetFontSizes,
  });

  static const byDefault = ScaleStyle.only();

  static const min6 = ScaleStyle.only(minFontSize: 6);

  static const min12 = byDefault;

  const ScaleStyle.only({
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.stepGranularity = 0.5,
    this.group,
    this.presetFontSizes,
  });
}

class HText extends StatelessWidget {
  final String? data;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final String? semanticsLabel;

  /// 自动缩放
  final ScaleStyle? scaleStyle;

  const HText(
    String this.data, {
    Key? key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.semanticsLabel,
    this.scaleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = data ?? "";
    /// 单行，超出显示 ...
    if (maxLines == 1 && overflow == TextOverflow.ellipsis) {
      text = text.fixOverflow();
    }
    if (scaleStyle != null) {
      return AutoSizeText(
        text,
        style: style,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        minFontSize: scaleStyle!.minFontSize,
        maxFontSize: scaleStyle!.maxFontSize,
        group: scaleStyle!.group,
        stepGranularity: scaleStyle!.stepGranularity,
        presetFontSizes: scaleStyle!.presetFontSizes,
      );
    }
    return Text(
      text,
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
    );
  }
}
