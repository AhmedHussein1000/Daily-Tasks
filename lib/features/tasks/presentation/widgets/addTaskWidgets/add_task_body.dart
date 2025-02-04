import 'package:flutter/material.dart';
import 'package:todo_app/core/themes/app_styles.dart';
import 'package:todo_app/features/tasks/presentation/widgets/addTaskWidgets/add_task_form.dart';

class AddTaskBody extends StatelessWidget {
  const AddTaskBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Fill your Task', style: Styles.styleSemiBold22(context),),
          const SizedBox(height: 20,),
          const AddTaskForm(),
          ],
      ),
    );
  }
}