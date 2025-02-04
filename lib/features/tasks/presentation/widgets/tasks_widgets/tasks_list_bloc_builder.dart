import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/widgets/custom_error_text.dart';
import 'package:todo_app/features/tasks/data/models/task_model.dart';
import 'package:todo_app/features/tasks/presentation/controllers/todo_tasks_cubit/todo_tasks_cubit.dart';
import 'package:todo_app/features/tasks/presentation/widgets/tasks_widgets/tasks_list.dart';
import 'package:todo_app/features/tasks/presentation/widgets/tasks_widgets/tasks_list_loading.dart';

class TasksListBlocBuilder extends StatelessWidget {
  const TasksListBlocBuilder(
      {super.key, required this.status, this.selectedDay});
  final String status;
  final DateTime? selectedDay;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoTasksCubit, TodoTasksState>(
        buildWhen: (previous, current) =>
            current is GetTasksSuccess ||
            current is GetTasksFailure ||
            current is GetTasksLoading,
        builder: (context, state) {
          if (state is GetTasksSuccess) {
            final List<TaskModel> newTasksPerDay = state.allTasks
                .where(
                  (task) =>
                      task.status == AppConstants.newTask &&
                      task.date ==
                          DateFormat.yMMMd()
                              .format(selectedDay ?? DateTime.now())
                              .toString(),
                )
                .toList();
            _sortTasksByTime(newTasksPerDay);   
            final List<TaskModel> tasks = state.allTasks
                .where(
                  (task) => task.status == status,
                )
                .toList();
                _sortTasksByTime(tasks);
            if( status == AppConstants.newTask){
       return newTasksPerDay.isNotEmpty ? TasksList(tasks: newTasksPerDay)
                : SliverFillRemaining(
                    child:
                        CustomTextMessage(text: 'No tasks found for this day'));
                
            }
            return tasks.isNotEmpty
                    ? TasksList(
                        tasks: tasks,
                        isDone: status == AppConstants.done,
                        isArchived: status == AppConstants.archived,
                      )
                    : SliverFillRemaining(
                        child:
                            CustomTextMessage(text: 'No $status tasks found'));
          } else if (state is GetTasksFailure) {
            return SliverFillRemaining(
                child: CustomTextMessage(text: state.message));
          }
          return TasksListLoading();
        });
  }

  void _sortTasksByTime(List<TaskModel> tasks) {
    
    tasks.sort((a, b) {
        final timeA = DateFormat("hh:mm a").parse(a.time); 
        final timeB = DateFormat("hh:mm a").parse(b.time);
        return timeA.compareTo(timeB);
      });   
  }
}
