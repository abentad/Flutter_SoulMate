import 'package:flutter/material.dart';
import 'package:soulmate/constants/color_constant.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.controller,
      required this.isObsecure,
      required this.prefixIcon,
      required this.suffixOnPressed,
      required this.hasSuffix})
      : super(key: key);

  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final bool isObsecure;
  final IconData prefixIcon;
  final bool hasSuffix;
  final Function() suffixOnPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(fontSize: 18.0),
      obscureText: isObsecure,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 16.0),
        label: Text(labelText, style: const TextStyle(color: textColor, fontSize: 16.0)),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        suffixIcon: hasSuffix
            ? isObsecure
                ? IconButton(icon: const Icon(Icons.visibility_off), onPressed: suffixOnPressed)
                : IconButton(icon: const Icon(Icons.visibility), onPressed: suffixOnPressed)
            : const SizedBox.shrink(),
      ),
    );
  }
}
