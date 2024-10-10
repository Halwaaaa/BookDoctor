import 'package:bookdoctor/core/constant/config.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/itemInformationSing.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustaminformaionAccount extends StatelessWidget {
  const CustaminformaionAccount({
    super.key,
    required this.config,
  });

  final Config config;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        itemInformation(config: config),
        itemInformation(config: config),
      ],
      options: CarouselOptions(
          scrollDirection: Axis.vertical,
          autoPlay: false,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          // aspectRatio: 1,
          viewportFraction: 1,
          height: MediaQuery.sizeOf(context).height * 0.4),
    );
  }
}
