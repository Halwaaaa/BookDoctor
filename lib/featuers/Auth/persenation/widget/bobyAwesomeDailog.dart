import 'package:bookdoctor/core/constant/config.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/singControl.dart';
import 'package:flutter/material.dart';

class bobyAwesomeDailog extends StatelessWidget {
  const bobyAwesomeDailog({
    super.key,
    required this.contrrol,
  });
  final SingContrrol contrrol;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Config().smallSpace(),
          Config().smallSpace(),
          TweenAnimationBuilder(
            duration: const Duration(milliseconds: 300),
            tween: IntTween(
                begin: contrrol.bytesTransferred,
                end: contrrol.bytesTransferred +
                    contrrol.AnimatedBytesTransferred),
            builder: (context, value, child) {
              return Text(value.toString());
            },
          ),
          Config().smallSpace(),
          Config().smallSpace(),
        ],
      ),
    );
  }
}
