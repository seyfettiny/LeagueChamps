import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  factory ToastService() => _instance;
  static final ToastService _instance = ToastService._internal();
  ToastService._internal();

  static void showBasicToast(String message, {Toast? duration, int? gravity}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: duration ?? Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  static void showErrorToast(String message, {Toast? duration, int? gravity}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: duration ?? Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showSuccessToast(String message,
      {Toast? duration, int? gravity}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: duration ?? Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
