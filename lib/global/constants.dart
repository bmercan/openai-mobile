import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants instance = ColorConstants._init();
  ColorConstants._init();

  //final kPrimaryColor = const Color(0xff46BDFA);
  final kPrimaryLightColor = const Color(0xff77E2FE);

  final kPrimaryColor =
      Colors.red; // Color(0xff1d1ce4); //const Color(0xff4791f2);
  final kSecondaryColor = const Color(0xff20366b);
  final kTextColor = const Color(0xff39425c);
  final kPaleBackground = Colors.grey.shade100;
}

class PagePadding extends EdgeInsets {
  static const double _normalValue = 10;

  const PagePadding.horizontalSymmetric()
      : super.symmetric(horizontal: _normalValue);
  const PagePadding.verticalSmmetric()
      : super.symmetric(vertical: _normalValue);
  const PagePadding.general()
      : super.only(
            left: _normalValue,
            right: _normalValue,
            top: _normalValue,
            bottom: _normalValue);
  const PagePadding.all() : super.all(_normalValue);
}

class RadiusConstant extends BorderRadius {
  const RadiusConstant.all() : super.all(const Radius.circular(16));
  const RadiusConstant.sharp() : super.all(const Radius.circular(10));
}

class MarginConstant extends EdgeInsets {
  const MarginConstant.all() : super.all(10);
  const MarginConstant.chatBubbleUser()
      : super.only(left: 40, right: 10, bottom: 10);
  const MarginConstant.chatBubbleGPT()
      : super.only(left: 10, right: 40, bottom: 10);
}

class PaddingConstant extends EdgeInsets {
  const PaddingConstant.all() : super.all(20);
  const PaddingConstant.symetric()
      : super.symmetric(horizontal: 5, vertical: 20);
}
