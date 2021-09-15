import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key, required this.hintText, required this.labelText, required this.controller, required this.isObsecure}) : super(key: key);

  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final bool isObsecure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(fontSize: 18.0),
      obscureText: isObsecure,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 16.0),
        label: Text(labelText, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16.0)),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Theme.of(context).primaryColor)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Theme.of(context).primaryColor)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Theme.of(context).primaryColor)),
      ),
    );
  }
}
