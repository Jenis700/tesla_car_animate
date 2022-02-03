import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<Widget> tyres(BoxConstraints constrains) {
  return [
    Positioned(
      top: constrains.maxWidth * 0.44,
      left: constrains.maxWidth * 0.185,
      child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),
    ),
    Positioned(
      top: constrains.maxWidth * 0.44,
      right: constrains.maxWidth * 0.185,
      child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),
    ),
    Positioned(
      bottom: constrains.maxWidth * 0.44,
      right: constrains.maxWidth * 0.175,
      child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),
    ),
    Positioned(
      bottom: constrains.maxWidth * 0.44,
      left: constrains.maxWidth * 0.175,
      child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),
    ),
  ];
}
