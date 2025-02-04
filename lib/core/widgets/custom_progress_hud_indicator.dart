import 'package:flutter/material.dart';
import 'package:todo_app/core/themes/app_colors.dart';

class CustomProgressHudIndicator extends StatelessWidget {
  const CustomProgressHudIndicator({super.key, required this.child, required this.isLoading, this.indicatorColor});
  final Widget child;
  final bool isLoading;
  final Color? indicatorColor;
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Stack(
        children: [
          child,
          Container(
            color: Colors.black.withAlpha((0.5*255).toInt() ),
            child: Center(
              child: CircularProgressIndicator(
                color: indicatorColor ?? AppColors.deepOrangePrimaryColor,
              ),
            ),
          ),
        ],
      );
    } else {
      return child;
    }
  }
}
