import 'package:flutter/material.dart';

EdgeInsetsGeometry responsivePadding(MediaQueryData mediaQuery) {
  double width = mediaQuery.size.width;
  if (width < 700) {
    return EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  }
  else if (width < 1200) {
    return EdgeInsets.symmetric(horizontal: 50, vertical: 25);
  }
  else if (width < 1650) {
    return EdgeInsets.symmetric(horizontal: 80, vertical: 40);
  }
  return EdgeInsets.symmetric(horizontal: 100, vertical: 50);
}

int responsiveNumberGridTiles(MediaQueryData mediaQuery) {
  double width = mediaQuery.size.width;
  if (width < 700) {
    return 1;
  }
  else if (width < 1200) {
    return 2;
  }
  else if (width < 1650) {
    return 3;
  }
  return 4;
}

double responsiveImageHeight(MediaQueryData mediaQuery) {
  double width = mediaQuery.size.width;
  if (width < 700) {
    return 250;
  }
  else if (width < 1200) {
    return width * 0.25;
  }
  else if (width < 1650) {
    return width * 0.2;
  }
  return width * 0.15;
}

double responsiveTitleText(MediaQueryData mediaQuery) {
  double width = mediaQuery.size.width;
  if (width < 700) {
    return 120;
  }
  else if (width < 1200) {
    return width * 0.1;
  }
  else if (width < 1650) {
    return width * 0.07;
  }
  return width * 0.05;
}