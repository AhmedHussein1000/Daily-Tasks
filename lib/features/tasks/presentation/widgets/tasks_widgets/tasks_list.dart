import 'package:flutter/material.dart';
import 'package:todo_app/features/tasks/data/models/task_model.dart';
import 'package:todo_app/features/tasks/presentation/widgets/tasks_widgets/task_item.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key, required this.tasks, this.isDone, this.isArchived});
  final List<TaskModel> tasks;
  final bool? isDone;
  final bool? isArchived;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: tasks.length,
      itemBuilder: (context, index) => TaskItem(
        taskModel: tasks[index],
        isDone: isDone,
        isArchived: isArchived,
      ),
    );
  }
}
