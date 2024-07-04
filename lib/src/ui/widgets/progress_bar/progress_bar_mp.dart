import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:halo_basics/halo_widgets.dart';
import 'package:halo_basics/halo_theme.dart';

const _lv1LinearColors = [
  Color.fromRGBO(66, 69, 84, 1),
  Color.fromRGBO(200, 208, 245, 1),
];
const _lv2LinearColors = [
  Color.fromRGBO(53, 23, 135, 1),
  Color.fromRGBO(113, 101, 255, 1),
];
const _lv3LinearColors = [
  Color.fromRGBO(6, 61, 73, 1),
  Color.fromRGBO(48, 218, 255, 1),
];
const _lv4LinearColors = [
  Color.fromRGBO(17, 47, 109, 1),
  Color.fromRGBO(72, 134, 255, 1),
];
const _lv5LinearColors = [
  Color.fromRGBO(5, 67, 47, 1),
  Color.fromRGBO(8, 194, 132, 1),
];
const _lv6LinearColors = [
  Color.fromRGBO(91, 75, 24, 1),
  Color.fromRGBO(237, 207, 103, 1),
];

class ProgressBarMp extends StatefulWidget {
  final double height;
  final double progress;
  final double total;
  final Color bgColor;
  final Color trackColor;
  final Color? trackColorNextLv;
  final String? thumbAsset;
  final String? lvTag;
  final double thumbProgress;
  final List<Color> linearColors;
  final List<Color> linearColorsNextLv;

  const ProgressBarMp({
    super.key,
    this.height = 8,
    this.progress = 0,
    this.total = 100,
    this.thumbProgress = 0.8,
    required this.bgColor,
    this.trackColor = const Color.fromRGBO(109, 120, 143, 0.24),
    this.trackColorNextLv,
    required this.linearColors,
    required this.linearColorsNextLv,
    this.thumbAsset,
    this.lvTag,
  });

  factory ProgressBarMp.fromLevel({
    int level = 0,
    double progress = 0,
    double total = 100,
    Color? bgColor,
    double thumbProgress = 0.8,
  }) {
    var func = ProgressBarMp.fromLv0;

    switch (level) {
      case 1:
        func = ProgressBarMp.fromLv1;
        break;
      case 2:
        func = ProgressBarMp.fromLv2;
        break;
      case 3:
        func = ProgressBarMp.fromLv3;
        break;
      case 4:
        func = ProgressBarMp.fromLv4;
        break;
      case 5:
        func = ProgressBarMp.fromLv5;
        break;
      case 6:
        func = ProgressBarMp.fromLv6;
        break;
    }
    return func(
      progress: progress,
      total: total,
      bgColor: bgColor,
      thumbProgress: thumbProgress,
    );
  }

  factory ProgressBarMp.fromLv0({
    double progress = 0,
    double total = 100,
    Color? bgColor,
    double thumbProgress = 2,
  }) =>
      ProgressBarMp(
        progress: progress,
        total: total,
        thumbProgress: 2,
        // 设置到屏幕外
        bgColor: bgColor ?? HTheme.darkColor.bgESecondary,
        linearColors: _lv5LinearColors,
        linearColorsNextLv: _lv5LinearColors,
      );

  factory ProgressBarMp.fromLv1({
    double progress = 0,
    double total = 100,
    Color? bgColor,
    double thumbProgress = 0.8,
  }) =>
      ProgressBarMp(
        progress: progress,
        total: total,
        bgColor: bgColor ?? HTheme.darkColor.bgSecondary,
        trackColorNextLv: const Color.fromRGBO(83, 34, 209, 0.3),
        linearColors: _lv1LinearColors,
        linearColorsNextLv: _lv2LinearColors,
        thumbAsset: "assets/images/icon_mp_lv2.png",
        lvTag: 'Lv2',
        thumbProgress: thumbProgress,
      );

  factory ProgressBarMp.fromLv2({
    double progress = 0,
    double total = 100,
    Color? bgColor,
    double thumbProgress = 0.8,
  }) =>
      ProgressBarMp(
        progress: progress,
        total: total,
        bgColor: bgColor ?? HTheme.darkColor.bgSecondary,
        trackColorNextLv: const Color.fromRGBO(46, 175, 230, 0.3),
        linearColors: _lv2LinearColors,
        linearColorsNextLv: _lv3LinearColors,
        thumbAsset: "assets/images/icon_mp_lv3.png",
        lvTag: 'Lv3',
        thumbProgress: thumbProgress,
      );

  factory ProgressBarMp.fromLv3({
    double progress = 0,
    double total = 100,
    Color? bgColor,
    double thumbProgress = 0.8,
  }) =>
      ProgressBarMp(
        progress: progress,
        total: total,
        bgColor: bgColor ?? HTheme.darkColor.bgSecondary,
        trackColorNextLv: const Color.fromRGBO(61, 128, 255, 0.3),
        linearColors: _lv3LinearColors,
        linearColorsNextLv: _lv4LinearColors,
        thumbAsset: "assets/images/icon_mp_lv4.png",
        lvTag: 'Lv4',
        thumbProgress: thumbProgress,
      );

  factory ProgressBarMp.fromLv4({
    double progress = 0,
    double total = 100,
    Color? bgColor,
    double thumbProgress = 0.8,
  }) =>
      ProgressBarMp(
        progress: progress,
        total: total,
        bgColor: bgColor ?? HTheme.darkColor.bgSecondary,
        trackColorNextLv: const Color.fromRGBO(8, 194, 132, 0.3),
        linearColors: _lv4LinearColors,
        linearColorsNextLv: _lv5LinearColors,
        thumbAsset: "assets/images/icon_mp_lv5.png",
        lvTag: 'Lv5',
        thumbProgress: thumbProgress,
      );

  factory ProgressBarMp.fromLv5({
    double progress = 0,
    double total = 100,
    Color? bgColor,
    double thumbProgress = 0.8,
  }) =>
      ProgressBarMp(
        progress: progress,
        total: total,
        bgColor: bgColor ?? HTheme.darkColor.bgSecondary,
        trackColorNextLv: const Color.fromRGBO(117, 104, 71, 0.3),
        linearColors: _lv5LinearColors,
        linearColorsNextLv: _lv6LinearColors,
        thumbAsset: "assets/images/icon_mp_lv6.png",
        lvTag: 'Lv6',
        thumbProgress: thumbProgress,
      );

  factory ProgressBarMp.fromLv6({
    double progress = 0,
    double total = 100,
    Color? bgColor,
    double thumbProgress = 1,
  }) =>
      ProgressBarMp(
        progress: progress,
        total: total,
        bgColor: bgColor ?? HTheme.darkColor.bgSecondary,
        linearColors: _lv6LinearColors,
        linearColorsNextLv: _lv6LinearColors,
        thumbProgress: 1,
        thumbAsset: "assets/images/icon_mp_top1.png",
        lvTag: 'Top 1',
      );

  @override
  State<ProgressBarMp> createState() => _ProgressBarMpState();
}

class _ProgressBarMpState extends BasicState<ProgressBarMp> {
  ui.Image? imageLv;


  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  @override
  void didUpdateWidget(covariant ProgressBarMp oldWidget) {
    if (widget.thumbAsset != oldWidget.thumbAsset) {
      _loadImage();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 8),
      painter: _ProgressBarMpPainter(
        widget.progress,
        widget.total,
        widget.bgColor,
        widget.trackColor,
        widget.trackColorNextLv,
        widget.linearColors,
        widget.linearColorsNextLv,
        imageLv,
        widget.lvTag,
        widget.thumbProgress,
      ),
    ).extStyle(padding: const EdgeInsets.only(bottom: 20));
  }

  void _loadImage() async {
    if (widget.thumbAsset != null) {
      AssetImage(widget.thumbAsset!).obtainKey(ImageConfiguration()).then((key) {
        return key.bundle.load(key.name);
      }).then((byteData) {
        return ui.instantiateImageCodec(byteData.buffer.asUint8List());
      }).then((codec) {
        return codec.getNextFrame();
      }).then((frameInfo) {
        setSafeState(() {
          imageLv = frameInfo.image;
        });
      });
      // final ByteData data = await rootBundle.load(widget.thumbAsset!);
      // ui.decodeImageFromList(Uint8List.view(data.buffer), (result) {
      //   setSafeState(() {
      //     imageLv = result;
      //   });
      // });
    } else {
      setSafeState(() {
        imageLv = null;
      });
    }
  }
}

class _ProgressBarMpPainter extends CustomPainter {
  final double thumbProgress;
  double progress;
  double total;
  final Color bgColor;
  final Color trackColor;
  final Color? trackColorNextLv;
  final List<Color> linearColors;
  final List<Color> linearColorsNextLv;
  ui.Image? image;
  String? lvTag;

  _ProgressBarMpPainter(
    this.progress,
    this.total,
    this.bgColor,
    this.trackColor,
    this.trackColorNextLv,
    this.linearColors,
    this.linearColorsNextLv,
    this.image,
    this.lvTag,
    this.thumbProgress,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var r = size.height / 2;
    Paint paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = trackColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.height;
    // draw background
    canvas.save();
    canvas.clipRect(Rect.fromLTRB(0, 0, size.width, size.height));
    canvas.drawLine(Offset(r, r), Offset(size.width - r, r), paint);

    var totalLength = (size.width - r * 2);
    if (trackColorNextLv != null) {
      paint.color = trackColorNextLv!;
      // draw 2nd background
      canvas.drawLine(Offset(r, r), Offset(r + totalLength * thumbProgress, r), paint);
    }
    var progressLength = totalLength * (progress / total) + r;
    if (progress / total < thumbProgress) {
      paint
        ..color = Colors.black
        ..shader = ui.Gradient.linear(Offset.zero, Offset(progressLength, 0), linearColors);
    } else {
      paint
        ..color = Colors.black
        ..shader = ui.Gradient.linear(Offset.zero, Offset(progressLength, 0), linearColorsNextLv);
    }

    // draw progress
    canvas.drawLine(Offset(r, r), Offset(progressLength, r), paint);
    canvas.drawCircle(
        Offset((r+ totalLength * thumbProgress), r),
        8.5,
        Paint()
          ..color = bgColor
          ..style = PaintingStyle.fill
          ..strokeWidth = 1);
    canvas.restore();
    if (image != null) {
      var imageWidth = image!.width;
      var scale = 14 / imageWidth; // 图片的目标高度
      canvas.save();
      canvas.scale(scale);
      canvas.drawImage(
          image!,
          Offset(
            (r + totalLength * thumbProgress - 7) / scale,
            size.height / scale / 2 - imageWidth / 2,
          ),
          Paint()..isAntiAlias = true);

      canvas.restore();
      if (lvTag != null) {
        var builder = ui.ParagraphBuilder(ui.ParagraphStyle(
          textAlign: TextAlign.start,
          maxLines: 1,
        ));
        builder.pushStyle(ui.TextStyle(
          color: HTheme.darkColor.tcSecondary,
          fontFamily: "HarmonyOS",
          fontSize: 12,
          height: 1.33,
          fontStyle: FontStyle.italic,
        ));
        builder.addText(lvTag!);
        var p = builder.build();
        p.layout(const ui.ParagraphConstraints(width: 50));
        canvas.drawParagraph(p, Offset(r + totalLength * thumbProgress - p.maxIntrinsicWidth / 2, 12));
      }
    }
  }

  @override
  bool shouldRepaint(covariant _ProgressBarMpPainter oldDelegate) {
    return progress != oldDelegate.progress || total != oldDelegate.total || image != oldDelegate.image;
  }
}
