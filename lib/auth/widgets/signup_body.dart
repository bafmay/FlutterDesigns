import 'package:flutter/material.dart';
import 'package:flutter_design/auth/screen/login/login_screen.dart';
import 'package:flutter_design/auth/widgets/already_have_account.dart';
import 'package:flutter_design/auth/widgets/or_divider.dart';
import 'package:flutter_design/auth/widgets/rounded_button.dart';
import 'package:flutter_design/auth/widgets/rounded_inputfield.dart';
import 'package:flutter_design/auth/widgets/rounded_passwordfield.dart';
import 'package:flutter_design/auth/widgets/signup_background.dart';
import 'package:flutter_design/auth/widgets/social_icon.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SIGN UP',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                'assets/auth/icons/signup.svg',
                height: size.height * 0.35,
              ),
              RoundedInputField(
                hint: "Your Email",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              RoundedButton(
                text: 'SIGN UP',
                onPressed: () {},
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginScreen())),
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialIcon(path: 'assets/auth/icons/facebook.svg'),
                  SocialIcon(path: 'assets/auth/icons/twitter.svg'),
                  SocialIcon(path: 'assets/auth/icons/google-plus.svg'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
