import 'package:flutter/material.dart';
import 'package:todo_app/core/themes/app_colors.dart';
import 'package:todo_app/features/tasks/presentation/widgets/addTaskWidgets/color_item.dart';

class ColorsList extends StatefulWidget {
  const ColorsList({super.key, required this.onColorChanged});
  final ValueChanged<int> onColorChanged;
  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: AppColors.tasksColors.length,
        itemBuilder: (context, index) => ColorItem(
            onTap: () {
              
                currentIndex = index;
              
              widget.onColorChanged(index);
              setState(() {});
            },
            backgroundColor: AppColors.tasksColors[index],
            isSelected: index == currentIndex),
      ),
    );
  }
}
