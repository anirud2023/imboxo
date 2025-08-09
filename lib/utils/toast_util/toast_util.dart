import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ToastUtil {
  static void show(String message, {Color? bgColor, Color? textColor}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: bgColor ?? Colors.black87,
      textColor: textColor ?? Colors.white,
      fontSize: 14.0,
    );
  }
}
