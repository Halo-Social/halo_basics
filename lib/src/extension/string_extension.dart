import 'package:decimal/decimal.dart';
import 'package:halo_basics/halo_money_formatter.dart';

///保留8位小数，有千分位
MoneyFormatterSettings amountFormatterSettings = MoneyFormatterSettings(
  thousandSeparator: ',',
  decimalSeparator: '.',
  fractionDigits: 8,
);

MoneyFormatterSettings priceFormatterSettings = MoneyFormatterSettings(
  thousandSeparator: ',',
  decimalSeparator: '.',
  fractionDigits: 2,
);

///保留8位小数，没有千分位
MoneyFormatterSettings amountFormatter2Settings = MoneyFormatterSettings(
  thousandSeparator: '',
  decimalSeparator: '.',
  fractionDigits: 8,
);

///保留5位小数，有千分位
MoneyFormatterSettings amountFormatter3Settings = MoneyFormatterSettings(
  thousandSeparator: ',',
  decimalSeparator: '.',
  fractionDigits: 5,
);

/// 小于 0.00001常量，带小于号
const String less00001 = '< 0.00001';

///
const String zero = '0';

String followerNumberFromInt(number) {
  if (number >= 10000) {
    return stringFromIntWithUnit(number, fix: 1);
  } else {
    return number.toString().toThousandFormat();
  }
}

String stringFromIntWithUnit(int number, {int fix = 2}) {
  if (number > 1000000) {
    return '${(number / 1000000.0).toStringAsFixed(fix)}M';
  } else if (number > 1000) {
    return '${(number / 1000.0).toStringAsFixed(fix)}K';
  }
  return '';
}

extension StrExt on String {
  String toThousandFormat() {
    List<String> parts = split(".");
    var num = Decimal.tryParse(parts[0]) ?? Decimal.zero;
    var dotNumber = parts.length == 1 ? -1 : parts[1].length;
    MoneyFormatter fmf = MoneyFormatter(
        amount: num.toDouble(),
        settings: MoneyFormatterSettings(
          thousandSeparator: ',',
          decimalSeparator: '.',
          fractionDigits: 0,
        ));
    if (dotNumber == 0) {
      return fmf.output.nonSymbol + ".";
    }
    if (parts.length > 1) {
      Decimal dd = Decimal.tryParse(this) ?? Decimal.zero;

      /// (-1,0)
      if (dd > Decimal.parse("-1") && dd < Decimal.zero) {
        return "-${fmf.output.nonSymbol}.${parts[1]}";
      }
      return "${fmf.output.nonSymbol}.${parts[1]}";
    } else {
      return fmf.output.nonSymbol;
    }
  }

  String toThousandAmountFormat() {
    var num = Decimal.tryParse(this) ?? Decimal.zero;
    num = ((num * Decimal.ten.pow(8)).floor() / Decimal.ten.pow(8)).toDecimal();
    MoneyFormatter fmf = MoneyFormatter(amount: num.toDouble(), settings: amountFormatterSettings);
    return fmf.output.nonSymbol.toDeleteZero();
  }

  ///保留8位小数，有千分位
  String toThousandCeilAmountFormat() {
    var num = Decimal.tryParse(this) ?? Decimal.zero;
    num = ((num * Decimal.ten.pow(8)).ceil() / Decimal.ten.pow(8)).toDecimal();
    MoneyFormatter fmf = MoneyFormatter(amount: num.toDouble(), settings: amountFormatterSettings);
    return fmf.output.nonSymbol.toDeleteZero();
  }

  ///首页资产数量展示
  ///1.数量为 0 时直接展示 0
  ///2.数量小于 0.00001 时, 直接显示 < 0.00001
  ///3.默认取 5 位有效小数
  ///4.数量为超过千万时，取 2 位有效小数
  String toIndexAssetAmountFormat() {
    var num = Decimal.tryParse(this) ?? Decimal.zero;
    if (num.compareTo(Decimal.fromInt(10000000)) >= 0) {
      //数量是否大于1千万，取 2 位有效小数
      num = ((num * Decimal.ten.pow(2)).floor() / Decimal.ten.pow(2)).toDecimal();
      MoneyFormatter fmf = MoneyFormatter(amount: num.toDouble(), settings: priceFormatterSettings);
      return fmf.output.nonSymbol.toDeleteZero();
    } else {
      if (num.compareTo(Decimal.parse('0.00000001')) < 0) {
        //数量小于0.00000001
        return zero;
      } else if (num.compareTo(Decimal.parse('0.00001')) < 0) {
        //数量小于 0.00001 时, 直接显示 < 0.00001
        return less00001;
      } else {
        //默认取 5 位有效小数
        num = ((num * Decimal.ten.pow(5)).floor() / Decimal.ten.pow(5)).toDecimal();
        MoneyFormatter fmf = MoneyFormatter(amount: num.toDouble(), settings: amountFormatter3Settings);
        return fmf.output.nonSymbol.toDeleteZero();
      }
    }
  }

  ///保留8位小数，没有千分位
  String toThousandCeilAmountFormatNoSeparator() {
    var num = Decimal.tryParse(this) ?? Decimal.zero;
    num = ((num * Decimal.ten.pow(8)).ceil() / Decimal.ten.pow(8)).toDecimal();
    MoneyFormatter fmf = MoneyFormatter(amount: num.toDouble(), settings: amountFormatter2Settings);
    return fmf.output.nonSymbol.toDeleteZero();
  }

  /// gas fee 格式化
  String gasFeeFormat({int scale = 6}) {
    var num = Decimal.tryParse(this) ?? Decimal.zero;
    num = (num.shift(scale)).ceil().shift(-scale);
    MoneyFormatter fmf = MoneyFormatter(amount: num.toDouble(), settings: amountFormatter2Settings);
    return fmf.output.nonSymbol.toDeleteZero();
  }

  /// SWAP 页面balance格式化
  /// 金额超过10W 显示4位小数
  /// 金额超过1000W 显示2位小数
  /// 默认8位小数
  String toThousandSwapAmountFormat() {
    var num = Decimal.tryParse(this) ?? Decimal.zero;
    List<String> parts = split(".");
    var digitsNumber = parts.length == 1 ? -1 : parts[0].length;
    var fractionDigits = 8;
    if (digitsNumber > 5 && digitsNumber <= 7) {
      fractionDigits = 4;
    } else if (digitsNumber > 7) {
      fractionDigits = 2;
    }
    num = ((num * Decimal.ten.pow(8)).floor() / Decimal.ten.pow(8)).toDecimal();
    MoneyFormatter fmf = MoneyFormatter(
        amount: num.toDouble(),
        settings: MoneyFormatterSettings(
          thousandSeparator: ',',
          decimalSeparator: '.',
          fractionDigits: fractionDigits,
        ));
    return fmf.output.nonSymbol.toDeleteZero();
  }

  String toThousandPriceFormat() {
    var num = Decimal.tryParse(this) ?? Decimal.zero;
    MoneyFormatter fmf = MoneyFormatter(amount: num.toDouble(), settings: priceFormatterSettings);
    return fmf.output.nonSymbol;
  }

  String toAmountFormat() {
    var num = Decimal.tryParse(this) ?? Decimal.zero;
    num = ((num * Decimal.ten.pow(8)).floor() / Decimal.ten.pow(8)).toDecimal();
    var numDouble = num.toDouble();
    if (numDouble.isInfinite || numDouble.isNaN) {
      numDouble = 0;
    }
    MoneyFormatter fmf = MoneyFormatter(amount: numDouble, settings: amountFormatter2Settings);
    return fmf.output.nonSymbol.toDeleteZero();
  }

  String toAmountFormatWithPrecision(int precision) {
    var num = Decimal.tryParse(this) ?? Decimal.zero;
    num = ((num * Decimal.ten.pow(precision)).floor() / Decimal.ten.pow(precision)).toDecimal();
    MoneyFormatter fmf = MoneyFormatter(amount: num.toDouble(), settings: amountFormatter2Settings);
    return fmf.output.nonSymbol.toDeleteZero();
  }

  bool toBool() {
    if (true.toString() == this) {
      return true;
    } else {
      return false;
    }
  }

  int? toInt() {
    return int.tryParse(this);
  }

  String toDeleteZero() {
    if (this == '') {
      return this;
    }
    int length = this.length;
    if (!contains('.')) {
      return this;
    }
    int pointIndex = indexOf('.');
    int index = -1;
    for (int i = length - 1; i > 0; i--) {
      String s = this[i];
      if (s != '0' && i > pointIndex) {
        index = i + 1;
        break;
      }
      if (i == pointIndex) {
        index = i;
        break;
      }
    }
    if (index < length) {
      return substring(0, index);
    } else {
      return this;
    }
  }

  String toFormatDownNoZero(int precision) {
    var num = Decimal.tryParse(this) ?? Decimal.zero;
    return num.toDouble().toStringAsFixed(precision);
  }

  String fixOverflow() {
    String breakWord = '';
    for (var element in runes) {
      breakWord += String.fromCharCode(element);
      breakWord += '\u200B';
    }

    return breakWord;
  }

  String get first => this[0];

  String get last => this[length - 1];

  /// 首字母大小
  String capitalize() {
    if (length == 0) return this;
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String toPercent({bool multiplyBy100 = false}) {
    try {
      Decimal decimal = Decimal.parse(this);
      return (decimal * Decimal.fromInt(multiplyBy100 ? 100 : 1)).toStringAsFixed(2) + "%";
    } catch (error) {
      return this;
    }
  }
}

extension StrNullExt on String? {
  bool get isEmptyOrNull => this == null || this!.isEmpty;
}
