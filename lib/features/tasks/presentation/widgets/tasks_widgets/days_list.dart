import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/tasks/presentation/controllers/select_day_cubit/select_day_cubit.dart';
import 'package:todo_app/features/tasks/presentation/widgets/tasks_widgets/day_item.dart';

class DaysList extends StatelessWidget {
  const DaysList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SelectDayCubit>();
    return BlocBuilder<SelectDayCubit, int>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return SizedBox(
            height: 100,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              separatorBuilder: (context, index) => const SizedBox(
                width: 15,
              ),
              itemCount: cubit.days.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => DayItem(
                day: cubit.days[index],
                isSelected: state == index,
                onTap: () {
                  cubit.selectDay(index: index);
                },
              ),
            ));
      },
    );
  }
}
