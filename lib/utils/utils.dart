import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
     margin: const EdgeInsets.all(10),
     duration: Duration(seconds: 2),
      content: Text(message, style: TextStyle(color: Colors.white)),
      backgroundColor: color ,
    ),
  );
}