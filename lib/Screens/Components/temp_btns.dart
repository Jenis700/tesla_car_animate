import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class TempButtons extends StatelessWidget {
  const TempButtons({
    Key? key,
    required this.svgSrc,
    required this.title,
    required this.press,
    required this.isActive,
    this.activeColor = primaryColor,
  }) : super(key: key);

  final String svgSrc;
  final String title;
  final VoidCallback press;
  final bool isActive;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOutBack,
            height: isActive ? 76 : 50,
            width: isActive ? 76 : 50,
            child: SvgPicture.asset(
              svgSrc,
              color: isActive ? activeColor : Colors.white38,
            ),
          ),
          SizedBox(height: defaultPadding / 2),
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: 16,
              color: isActive ? activeColor : Colors.white38,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
            child: Text(
              title.toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }
}
