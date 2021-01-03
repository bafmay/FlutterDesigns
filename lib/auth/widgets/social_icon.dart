import 'package:flutter/material.dart';
import 'package:flutter_design/auth/utils/auth_colors.dart';
import 'package:flutter_svg/svg.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    Key key,
    @required this.path,
    this.press,
  }) : super(key: key);
  final String path;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: primaryLightColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          path,
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
