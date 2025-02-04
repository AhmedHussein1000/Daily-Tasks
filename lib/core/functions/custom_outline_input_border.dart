import 'package:flutter/material.dart';

OutlineInputBorder customOutlineInputBorder({required Color borderColor}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide:
          BorderSide(color: borderColor ), 
    );
}