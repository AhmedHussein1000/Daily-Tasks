import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/functions/show_toast.dart';
import 'package:todo_app/core/helpers/extensions.dart';
import 'package:todo_app/core/utils/enums.dart';
import 'package:todo_app/core/widgets/custom_progress_hud_indicator.dart';
import 'package:todo_app/features/tasks/presentation/controllers/todo_tasks_cubit/todo_tasks_cubit.dart';
import 'package:todo_app/features/tasks/presentation/widgets/addTaskWidgets/add_task_body.dart';

class AddTaskBodyBlocConsumer extends StatelessWidget {
  const AddTaskBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoTasksCubit, TodoTasksState>(
      listener: (context, state) {
        if (state is AddTaskSuccess) {
          customToast(message: state.message, state: ToastStates.success);
          context.pop();
          context.read<TodoTasksCubit>().getTasks();
        }
        if (state is AddTaskFailure) {
          customToast(message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        return CustomProgressHudIndicator(
            isLoading: state is AddTaskLoading, child: AddTaskBody());
      },
    );
  }
}
