import 'package:flutter/material.dart';

class CustomCircleIndicator extends StatelessWidget {
  const CustomCircleIndicator({
    super.key, this.indicatorColor,
  });
final Color? indicatorColor;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(
        color:  indicatorColor,
      ),
    );
  }
}
