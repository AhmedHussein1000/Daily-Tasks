// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:todo_app/core/themes/app_colors.dart';
// import 'package:todo_app/core/themes/app_styles.dart';
// import 'package:todo_app/features/tasks/presentation/controllers/tasksCubit/tasks_cubit.dart';

// class DayItem extends StatelessWidget {
//   const DayItem({super.key, required this.index});
//   final int index;
//   @override
//   Widget build(BuildContext context) {

//         return GestureDetector(
//           onTap: () => TasksCubit.get(context).selectDay(index: index),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: TasksCubit.get(context).day ==
//                       TasksCubit.get(context).days[index]
//                   ? kprimaryColor
//                   : Colors.grey.shade100,
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   DateFormat('MMM').format(TasksCubit.get(context).days[index]),
//                   style: Styles.styleMedium18(context).copyWith(color: Colors.black),
//                 ),
//                 Text(
//                   DateFormat('d').format(TasksCubit.get(context).days[index]),
//                   style: Styles.styleMedium18(context).copyWith(color: Colors.black),
//                 ),
//                 Text(
//                   DateFormat('EEEE')
//                       .format(TasksCubit.get(context).days[index])
//                       .substring(0, 3),
//                   style: Styles.styleMedium18(context).copyWith(color: Colors.black),
//                 ),
//               ],
//             ),
//           ),
//         );

//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/themes/app_colors.dart';
import 'package:todo_app/core/themes/app_styles.dart';

class DayItem extends StatelessWidget {
  const DayItem({super.key, required this.day, required this.isSelected,required this.onTap});
  final DateTime day;
  final bool isSelected;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected
              ? AppColors.deepOrangePrimaryColor
              : Colors.grey.shade100,
        ),
        child: Column(
          children: [
            Text(
              DateFormat('MMM').format(day),
              style:
                  Styles.styleMedium18(context).copyWith(color: Colors.black),
            ),
            Text(
              DateFormat('d').format(day),
              style:
                  Styles.styleMedium18(context).copyWith(color: Colors.black),
            ),
            Text(
              DateFormat('EEEE').format(day).substring(0, 3),
              style:
                  Styles.styleMedium18(context).copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
