import 'package:flutter/material.dart';
import 'package:todo_app/core/themes/app_colors.dart';

class NavBarItemModel {
  final Widget icon;
  final String title;
  final Color activeColorPrimary;
  final Color? inactiveColorPrimary;

  NavBarItemModel(
      {required this.icon,
      required this.title,
      this.activeColorPrimary = AppColors.deepOrangePrimaryColor,
      this.inactiveColorPrimary = AppColors.grey});
}

List<NavBarItemModel> navBarItems = [
  NavBarItemModel(icon: const Icon(Icons.task), title: "New"),
  NavBarItemModel(icon: const Icon(Icons.check_circle), title: "Done"),
  NavBarItemModel(icon: const Icon(Icons.archive), title: "Archived")
];
