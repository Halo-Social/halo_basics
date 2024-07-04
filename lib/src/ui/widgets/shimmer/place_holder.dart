import 'package:flutter/material.dart';

class SimplePlaceholder extends StatelessWidget {
  final Size size;
  double? radius;
  final EdgeInsetsGeometry? margin;
  SimplePlaceholder({Key? key, required this.size, this.radius, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double tempRadius = radius ?? (size.height < size.width ? size.height : size.width) / 2;
    return Container(
      width: size.width,
      height: size.height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(tempRadius),
        color: Colors.grey,
      ),
    );
  }
}

class RecordPlaceholder extends StatelessWidget {
  const RecordPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          SimplePlaceholder(size: Size(32, 32)),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimplePlaceholder(size: Size(120, 20)),
              SizedBox(height: 8),
              SimplePlaceholder(size: Size(80, 12)),
            ],
          ),
          Expanded(child: Container()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SimplePlaceholder(size: Size(64, 20)),
              SizedBox(height: 8),
              SimplePlaceholder(size: Size(48, 12)),
            ],
          )
        ],
      ),
    );
  }
}

enum ContentLineType {
  twoLines,
  threeLines,
}

class ContentPlaceholder extends StatelessWidget {
  final ContentLineType lineType;

  const ContentPlaceholder({
    Key? key,
    required this.lineType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 96.0,
            height: 72.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 10.0,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 8.0),
                ),
                if (lineType == ContentLineType.threeLines)
                  Container(
                    width: double.infinity,
                    height: 10.0,
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 8.0),
                  ),
                Container(
                  width: 100.0,
                  height: 10.0,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
