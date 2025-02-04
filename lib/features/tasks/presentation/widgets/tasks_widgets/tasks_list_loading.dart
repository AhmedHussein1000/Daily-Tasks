import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:todo_app/core/helpers/dummy_data.dart';
import 'package:todo_app/features/tasks/presentation/widgets/tasks_widgets/tasks_list.dart';

class TasksListLoading extends StatelessWidget {
  const TasksListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      enabled: true,
        child: TasksList(tasks: DummyData.getDummytasks()));
  }
}
