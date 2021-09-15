import 'package:flutter/material.dart';

class MyMaterialButton extends StatelessWidget {
  const MyMaterialButton({Key? key, required this.label, required this.onPressed}) : super(key: key);
  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600)),
      minWidth: double.infinity,
      height: 50.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Theme.of(context).primaryColor,
    );
  }
}
