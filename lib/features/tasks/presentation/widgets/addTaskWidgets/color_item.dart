import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem(
      {super.key,
      required this.isSelected,
      required this.onTap,
      required this.backgroundColor});
  final bool isSelected;
  final void Function()? onTap;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: backgroundColor,
        child: isSelected
            ? const Icon(
                Icons.done,
                color: Colors.white,
                size: 30,
              )
            : null,
      ),
    );
  }
}
