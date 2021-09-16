import 'package:flutter/material.dart';

SnackBar mySnackBar(BuildContext context, String message, int duration, Color textColor) => SnackBar(
      backgroundColor: Colors.white,
      duration: Duration(seconds: duration),
      content: Text(
        message,
        style: TextStyle(color: textColor),
      ),
    );

SnackBar myFloatingSnackBar(BuildContext context, String message, int duration, Color textColor) => SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
      duration: Duration(seconds: duration),
      content: Text(
        message,
        style: TextStyle(color: textColor),
      ),
    );
