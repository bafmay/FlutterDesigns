import 'package:flutter/material.dart';
import 'package:flutter_design/auth/screen/login/login_screen.dart';
import 'package:flutter_design/auth/screen/signup/signup_screen.dart';
import 'package:flutter_design/auth/utils/auth_colors.dart';
import 'package:flutter_design/auth/widgets/rounded_button.dart';
import 'package:flutter_design/auth/widgets/welcome_background.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WELCOME TO BRIAN',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              'assets/auth/icons/chat.svg',
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LoginScreen())),
            ),
            RoundedButton(
              text: "SIGN UP",
              textColor: Colors.black,
              color: primaryLightColor,
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SignUpScreen())),
            )
          ],
        ),
      ),
    );
  }
}
