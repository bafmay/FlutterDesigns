import 'package:flutter/material.dart';
import 'package:flutter_design/auth/utils/auth_colors.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.text,
    this.color = primaryColor,
    this.textColor = Colors.white,
    @required this.onPressed,
  }) : super(key: key);
  final String text;
  final Color color, textColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          color: color,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
