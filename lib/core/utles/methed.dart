import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

double ResponsvTextSize(double scale, double max, double min) {
  if (scale > max) {
    return max;
  } else if (scale < min) {
    return min;
  }
  return scale;
}

double ResponsvTextSizemix(
  double scale,
  double max,
) {
  if (scale > max) {
    return max;
  }
  return scale;
}

double ResponsvTextSizemin(
  double scale,
  double min,
) {
  if (scale < min) {
    return min;
  }
  return scale;
}

