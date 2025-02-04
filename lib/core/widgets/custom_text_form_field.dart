import 'package:flutter/material.dart';
import 'package:todo_app/core/helpers/extensions.dart';

class CustomTextformfield extends StatelessWidget {
  const CustomTextformfield(
      {super.key,
      required this.hintText,
      required this.controller,
      this.suffixIcon,
      this.readOnly,
      this.onTap});
  final String hintText;
  final TextEditingController controller;
  final Icon? suffixIcon;
  final bool? readOnly;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value.isNullOrEmpty()) {
          return 'This field is required';
        }
        return null;
      },
      controller: controller,
      readOnly: readOnly ?? false,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
