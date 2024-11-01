import 'package:flutter/material.dart';

class DafultLodingWidget extends StatelessWidget {
  DafultLodingWidget({
    super.key,
    required this.height,
    required this.width,
    this.ScraanColor,
  });
  final double height;
  final double width;

  Color? ScraanColor = Colors.white.withOpacity(0.4);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: ScraanColor,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
