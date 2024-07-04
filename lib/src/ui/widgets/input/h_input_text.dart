import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 输入框输入变化的监听
typedef HInputTextChangeCallback = Function(String input);

/// 输入框提交的监听
typedef HInputTextSubmitCallback = Function(String input);

/// 输入完成点击键盘监听
typedef HInputTextEditingCompleteCallback = Function(String input);

///  根据输入内容动态算高
///  为了解决text输入的时候高度计算的问题
///  支持设置最大最小高度
///  支持设置输入最大字数限制
///  支持最大最小行数限制

class HInputText extends StatelessWidget {
  /// 搜索框输入内容改变时候的回调函数
  final HInputTextChangeCallback? onTextChange;

  /// 点击确定后的回调
  final HInputTextSubmitCallback? onSubmit;

  /// 容器的最大高度，默认 200
  final double maxHeight;

  /// 最小的高度，默认 50
  final double minHeight;

  /// 整个容器的背景颜色，默认 Colors.white
  final Color bgColor;

  /// 输入框的hint文字，默认为"请输入..."
  final String hint;

  final TextStyle? hintStyle;

  /// 头
  final Widget? prefix;

  /// 尾
  final Widget? suffix;

  /// 输入框的初始值，默认为""
  /// 不能定义为String，兼容example调用的传值
  final String textString;

  /// 用于对 TextField  更精细的控制，若传入该字段，[textString] 参数将失效，可使用 TextEditingController.text 进行赋值。
  final TextEditingController? textEditingController;

  /// 最大字数，默认200
  final int maxLength;

  /// 最少几行，默认1
  final int minLines;

  /// 文字距离边框的边距，默认 EdgeInsets.zero
  final EdgeInsetsGeometry padding;

  /// 最大hint行数
  final int? maxHintLines;

  /// 搜索框的焦点控制器
  final FocusNode? focusNode;

  /// 键盘输入行为， 默认为 TextInputAction.done
  final TextInputAction textInputAction;

  /// 光标展示
  final bool? autoFocus;

  /// 背景圆角
  final double? borderRadius;

  /// 边框颜色
  final Color? borderColor;

  /// 光标颜色
  final Color? cursorColor;

  final bool? autocorrect;

  final bool? obscureText;

  /// 显示字数统计
  final bool showBuildCounter;

  final TextStyle? style;

  final Alignment? alignment;

  final List<TextInputFormatter>? inputFormatters;

  final TextInputType? keyboardType;

  /// 最大行数
  final int? maxLines;

  /// 主题色
  final Brightness keyboardAppearance;

  /// {@macro flutter.widgets.editableText.selectionControls}
  final TextSelectionControls? selectionControls;

  HInputText(
      {this.onTextChange,
      this.onSubmit,
      this.maxHeight = 200,
      this.minHeight = 50,
      this.bgColor = Colors.white,
      this.maxLength = 200,
      this.minLines = 1,
      this.hint = "请输入",
      this.hintStyle,
      this.prefix,
      this.suffix,
      this.maxHintLines,
      this.maxLines,
      this.padding = EdgeInsets.zero,
      this.textString = "",
      this.autoFocus,
      this.textEditingController,
      this.focusNode,
      this.textInputAction = TextInputAction.done,
      this.borderRadius,
      this.borderColor,
      this.showBuildCounter = false,
      this.cursorColor,
      this.style,
      this.alignment,
      this.inputFormatters,
      this.keyboardType,
      this.autocorrect,
      this.obscureText,
      this.selectionControls,
      this.keyboardAppearance = Brightness.light});

  @override
  Widget build(BuildContext context) {
    return _inputText(context);
  }

  Widget _inputText(BuildContext context) {
    String textData = textString;
    if (textString.runes.length > maxLength) {
      var sRunes = textData.runes;
      textData = String.fromCharCodes(sRunes, 0, maxLength);
    }
    var _controller = textEditingController;
    if (_controller == null) {
      if (textData.isNotEmpty) {
        _controller = TextEditingController.fromValue(TextEditingValue(
            text: textData,
            selection:
                TextSelection.fromPosition(TextPosition(affinity: TextAffinity.downstream, offset: textData.length))));
      } else {
        _controller = TextEditingController();
      }
    }
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: borderColor ?? Colors.transparent),
        // ignore: deprecated_member_use_from_same_package
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
      padding: padding,
      alignment: alignment,
      constraints: BoxConstraints(
        maxHeight: maxHeight,
        minHeight: minHeight,
      ),
      child: TextField(
        // 新增保持光标一直在文字最后
        inputFormatters: inputFormatters,
        controller: _controller,
        selectionControls: selectionControls,
        keyboardType: keyboardType ?? TextInputType.multiline,
        maxLength: maxLength,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        maxLines: maxLines,
        autofocus: autoFocus ?? true,
        focusNode: focusNode,
        minLines: minLines,
        textAlign: TextAlign.left,
        textInputAction: textInputAction,
        keyboardAppearance: keyboardAppearance,
        style: style,
        cursorColor: cursorColor,
        autocorrect: autocorrect ?? true,
        obscureText: obscureText ?? false,
        buildCounter: (
          BuildContext context, {
          required int currentLength,
          required int? maxLength,
          required bool isFocused,
        }) {
          if (!showBuildCounter) {
            return null;
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "$currentLength",
                style: const TextStyle(
                  color: Color(0xffcccccc),
                  fontSize: 16,
                ),
              ),
              Text(
                "/$maxLength",
                style: const TextStyle(
                  color: Color(0xffcccccc),
                  fontSize: 16,
                ),
              ),
            ],
          );
        },
        decoration: InputDecoration(
          hintText: hint,
          hintMaxLines: maxHintLines,
          hintStyle: hintStyle ?? const TextStyle(fontSize: 16.0, color: Color(0xFFCCCCCC)),
          contentPadding: const EdgeInsets.all(0),
          border: InputBorder.none,
          isDense: true,
          enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
          prefix: prefix,
          suffix: suffix,
        ),
        onSubmitted: (text) {
          if (onSubmit != null) {
            onSubmit!(text);
          }
        },

        onChanged: (text) {
          if (onTextChange != null) {
            onTextChange!(text);
          }
        },
      ),
    );
  }
}
