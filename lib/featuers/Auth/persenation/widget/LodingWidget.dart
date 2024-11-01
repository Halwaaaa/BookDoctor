import 'package:flutter/material.dart';

class LodingWidget extends StatelessWidget {
  const LodingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).height,
      color: Colors.white.withOpacity(0.4),
    );
  }
}
