import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/themes/app_styles.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/features/tasks/data/models/task_model.dart';
import 'package:todo_app/features/tasks/presentation/controllers/todo_tasks_cubit/todo_tasks_cubit.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(
      {super.key,
      this.isDone = false,
      this.isArchived = false,
      required this.taskModel});
  final bool? isDone;
  final bool? isArchived;
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    if (isDone == true) {
      return DoneTaskItem(taskModel: taskModel);
    } else if (isArchived == true) {
      return ArchivedTaskItem(taskModel: taskModel);
    }
    return NewTaskItem(taskModel: taskModel);
  }
}

class NewTaskItem extends StatelessWidget {
  const NewTaskItem({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Dismissible(
        key: ValueKey(taskModel.id),
        direction: DismissDirection.startToEnd,
        background: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
            color: Colors.red,
          ),
          child: const Icon(Icons.delete),
        ),
        onDismissed: (direction) =>
            context.read<TodoTasksCubit>().deleteTask(id: taskModel.id),
        child: Card(
          color: Color(taskModel.colorValue),
          child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              title: Text(
                taskModel.title,
                style:
                    Styles.styleMedium18(context).copyWith(color: Colors.white),
              ),
              subtitle: Row(
                children: [
                  Text(
                    taskModel.time,
                    style: Styles.styleRegular16(context)
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    taskModel.date,
                    style: Styles.styleRegular16(context)
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<TodoTasksCubit>().changeTaskState(
                          id: taskModel.id, status: AppConstants.done);
                    },
                    icon: Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<TodoTasksCubit>().changeTaskState(
                          id: taskModel.id, status: AppConstants.archived);
                    },
                    icon: Icon(
                      Icons.archive,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class DoneTaskItem extends StatelessWidget {
  const DoneTaskItem({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        color: Color(taskModel.colorValue),
        child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
            title: Text(
              taskModel.title,
              style:
                  Styles.styleMedium18(context).copyWith(color: Colors.white),
            ),
            subtitle: Row(
              children: [
                Text(
                  taskModel.time,
                  style: Styles.styleRegular16(context)
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  taskModel.date,
                  style: Styles.styleRegular16(context)
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                context.read<TodoTasksCubit>().changeTaskState(
                    id: taskModel.id, status: AppConstants.newTask);
              },
              icon: Icon(
                Icons.undo,
                color: Colors.white,
              ),
            )),
      ),
    );
  }
}

class ArchivedTaskItem extends StatelessWidget {
  const ArchivedTaskItem({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Dismissible(
        key: ValueKey(taskModel.id),
        direction: DismissDirection.startToEnd,
        background: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
            color: Colors.red,
          ),
          child: const Icon(Icons.delete),
        ),
        onDismissed: (direction) =>
            context.read<TodoTasksCubit>().deleteTask(id: taskModel.id),
        child: Card(
          color: Color(taskModel.colorValue),
          child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              title: Text(
                taskModel.title,
                style:
                    Styles.styleMedium18(context).copyWith(color: Colors.white),
              ),
              subtitle: Row(
                children: [
                  Text(
                    taskModel.time,
                    style: Styles.styleRegular16(context)
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    taskModel.date,
                    style: Styles.styleRegular16(context)
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<TodoTasksCubit>().changeTaskState(
                          id: taskModel.id, status: AppConstants.done);
                    },
                    icon: Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<TodoTasksCubit>().changeTaskState(
                          id: taskModel.id, status: AppConstants.newTask);
                    },
                    icon: Icon(
                      Icons.unarchive,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
