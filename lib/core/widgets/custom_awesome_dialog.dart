import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

AwesomeDialog customAwesomeDialog(
    {required BuildContext context,
    String? title,
    required String desc,
    DialogType? type,
    AnimType? animType,
    required void Function()? btnOkOnPress,
    void Function()? btnCancelOnPress,
    VoidCallback? onDissmissCallback}) {
  return AwesomeDialog(
    context: context,
    dialogType: type ?? DialogType.question,
    animType: animType?? AnimType.rightSlide,
    title: title,
    desc: desc,
    btnCancelOnPress:btnCancelOnPress,
    btnOkOnPress: btnOkOnPress,
  )..show();
}
