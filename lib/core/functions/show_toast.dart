import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/core/utils/enums.dart';

void customToast({required String message, required ToastStates state,Toast? toastLength}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength:  toastLength ?? Toast.LENGTH_LONG ,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: getColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}


Color getColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
  }
  return color;
}
