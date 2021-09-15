import 'package:flutter/material.dart';

SnackBar mySnackBar(BuildContext context, String message, int duration) => SnackBar(
      backgroundColor: Colors.white,
      duration: Duration(seconds: duration),
      content: Text(
        message,
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
