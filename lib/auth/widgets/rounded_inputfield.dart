import 'package:flutter/material.dart';
import 'package:flutter_design/auth/utils/auth_colors.dart';
import 'package:flutter_design/auth/widgets/textfield_container.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
    Key key,
    this.hint,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  final String hint;
  final IconData icon;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          icon: Icon(
            icon,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
