import 'package:flutter/material.dart';

class DetailsSened extends StatelessWidget {
  const DetailsSened(
      {super.key, required this.totalLenght, required this.bytesTransferred});

  final int? totalLenght;
  final int? bytesTransferred;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("${totalLenght}of$bytesTransferred")],
        ),
      ),
    );
  }
}
