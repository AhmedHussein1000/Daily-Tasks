import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/widgets/tasks_appbar.dart';
import 'package:todo_app/features/tasks/presentation/controllers/select_day_cubit/select_day_cubit.dart';
import 'package:todo_app/features/tasks/presentation/widgets/tasks_widgets/days_list.dart';
import 'package:todo_app/features/tasks/presentation/widgets/tasks_widgets/tasks_list_bloc_builder.dart';

class NewTasksScreen extends StatelessWidget {
  const NewTasksScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TasksAppBar(),
        body: BlocProvider(
          create: (context) => SelectDayCubit(),
          child: NewTasksBody(),
        ));
  }
}

class NewTasksBody extends StatelessWidget {
  const NewTasksBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectDayCubit, int>(builder: (context, state) {
      final selectedDay = context.read<SelectDayCubit>().days[state];
      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                DaysList(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          TasksListBlocBuilder(
            selectedDay: selectedDay,
            status: AppConstants.newTask,
          ),
        ],
      );
    });
  }
}
