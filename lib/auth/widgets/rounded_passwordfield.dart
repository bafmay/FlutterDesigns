import 'package:flutter/material.dart';
import 'package:flutter_design/auth/utils/auth_colors.dart';
import 'package:flutter_design/auth/widgets/textfield_container.dart';

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Password',
            icon: Icon(
              Icons.lock,
              color: primaryColor,
            ),
            suffixIcon: Icon(
              Icons.visibility,
              color: primaryColor,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
