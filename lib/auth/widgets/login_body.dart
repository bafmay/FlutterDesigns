import 'package:flutter/material.dart';
import 'package:flutter_design/auth/screen/signup/signup_screen.dart';
import 'package:flutter_design/auth/widgets/already_have_account.dart';
import 'package:flutter_design/auth/widgets/login_background.dart';
import 'package:flutter_design/auth/widgets/rounded_button.dart';
import 'package:flutter_design/auth/widgets/rounded_inputfield.dart';
import 'package:flutter_design/auth/widgets/rounded_passwordfield.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'LOGIN',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.03),
          SvgPicture.asset(
            'assets/auth/icons/login.svg',
            height: size.height * 0.35,
          ),
          SizedBox(height: size.height * 0.03),
          RoundedInputField(
            icon: Icons.person,
            hint: "Your Email",
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          RoundedButton(
            onPressed: () {},
            text: 'LOGIN',
          ),
          SizedBox(height: size.height * 0.03),
          AlreadyHaveAnAccountCheck(
            press: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => SignUpScreen())),
          ),
        ],
      ),
    );
  }
}
