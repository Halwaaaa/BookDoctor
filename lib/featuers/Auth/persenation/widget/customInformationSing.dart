import 'package:bookdoctor/core/constant/config.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/singControl.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/itemInformationSing.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/itemInformationSing2.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustaminformaionAccount extends StatelessWidget {
  const CustaminformaionAccount({
    super.key,
    required this.config,
    required this.singContrrol,
  });

  final Config config;
  final SingContrrol singContrrol;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: singContrrol.carouselController,
      items: [
        itemInformation1(config: config),
        itemInformation2(config: config),
      ],
      options: CarouselOptions(
          onPageChanged: (index, reason) {
            singContrrol.changedIndex(index);
          },
          scrollDirection: Axis.horizontal,
          autoPlay: false,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          // aspectRatio: 1,
          viewportFraction: 1,
          height: MediaQuery.sizeOf(context).height * 0.4),
    );
  }
}
