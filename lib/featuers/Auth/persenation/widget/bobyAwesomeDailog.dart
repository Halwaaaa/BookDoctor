import 'package:bookdoctor/core/constant/config.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/singControl.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class bobyAwesomeDailog extends StatelessWidget {
  bobyAwesomeDailog({
    super.key,
    required this.contrrol,
  });
  final SingContrrol contrrol;
  Config config = Config();

  @override
  Widget build(BuildContext context) {
    final int beginAnmitedText = contrrol.bytesTransferred;
    final int endAnmitedText = contrrol.bytesTransferred;
    final double beginAnimtedColoe =
        100 * contrrol.bytesTransferred.toDouble() / contrrol.totalLenghtFile;
    final double endAnimtedColoe = 100 * contrrol.bytesTransferred.toDouble() +
        contrrol.AnimatedBytesTransferred.toDouble() / contrrol.totalLenghtFile;

    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            config.smallSpace(),
            config.smallSpace(),
            Stack(textDirection: TextDirection.rtl, children: [
              Container(
                width: 300,
                height: 10,
                color: Colors.grey[300],
              ),
              // خط يمثل الحجم المرفوع
              Container(
                width: 300 *
                    contrrol.bytesTransferred.toDouble() /
                    contrrol.totalLenghtFile
                        .toDouble()
                        .toDouble(), // الطول يعتمد على نسبة الرفع
                height: 10,
                color: Colors.green, // لون الجزء المرفوع
              ),
            ]),
            TweenAnimationBuilder(
              duration: const Duration(milliseconds: 300),
              tween: IntTween(begin: beginAnmitedText, end: endAnmitedText),
              builder: (context, value, child) {
                return Row(
                  children: [
                    Text(value.toString()),
                    const Spacer(),
                    Text(contrrol.totalLenghtFile.toString())
                  ],
                );
              },
            ),
            Config().smallSpace(),
            Config().smallSpace(),
          ]),
    );
  }
}
