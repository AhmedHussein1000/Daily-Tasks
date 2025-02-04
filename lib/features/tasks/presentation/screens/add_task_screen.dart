import 'package:flutter/material.dart';
import 'package:todo_app/core/widgets/tasks_appbar.dart';
import 'package:todo_app/features/tasks/presentation/widgets/addTaskWidgets/add_task_body_bloc_consumer.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TasksAppBar(),
      body: AddTaskBodyBlocConsumer() ,
    );
  }
}
