import 'package:flutter/material.dart';
import 'package:flutter_design/auth/utils/auth_colors.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an Account? " : "Already have an account? ",
          style: TextStyle(color: primaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? 'Sign Up' : 'Sign In',
            style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
          ),
        )
      ],
    );
  }
}
