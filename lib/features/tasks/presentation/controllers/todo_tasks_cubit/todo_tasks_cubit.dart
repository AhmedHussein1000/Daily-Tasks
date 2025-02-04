import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/local_database/database_constants.dart';
import 'package:todo_app/core/local_database/database_helper.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/features/tasks/data/models/task_model.dart';

part 'todo_tasks_state.dart';

class TodoTasksCubit extends Cubit<TodoTasksState> {
  final DatabaseHelper databaseHelper;
  TodoTasksCubit(this.databaseHelper) : super(TasksInitial());
  addTask(
      {required String title,
      required String time,
      required String date,
      required int colorValue}) {
    emit(AddTaskLoading());
    databaseHelper
        .insertData(data: {
          DatabaseConstants.title: title,
          DatabaseConstants.time: time,
          DatabaseConstants.date: date,
          DatabaseConstants.colorValue: colorValue,
          DatabaseConstants.status: AppConstants.newTask
        })
        .then(
          (value) => emit(AddTaskSuccess(message: AppConstants.addTaskSuccess)),
        )
        .catchError((e) {
          log('error in addTask ${e.toString()}');
          emit(AddTaskFailure(message: AppConstants.addTaskFailure));
        });
  }

  getTasks() {
    emit(GetTasksLoading());
    databaseHelper.getData().then(
      (tasks) {
        List<TaskModel> allTasks = tasks
            .map(
              (jsonTask) => TaskModel.fromJson(jsonTask),
            )
            .toList();
        emit(GetTasksSuccess(allTasks: allTasks));
      },
    ).catchError((e) {
      log('error in getTasks ${e.toString()}');
      emit(GetTasksFailure(message: AppConstants.getTasksFailure));
    });
  }

  changeTaskState({required int id, required String status}) {
    databaseHelper
        .updateData(id: id, updatedData: {DatabaseConstants.status: status})
        .then(
          (value) => emit(ChangeTaskStateSuccess()),
        )
        .catchError((e) {
          log('error in changeTaskState ${e.toString()}');
          emit(ChangeTaskStateFailure(AppConstants.addTaskFailure));
        });
  }

  updateTask({required TaskModel taskModel}) {
    databaseHelper.updateData(id: taskModel.id, updatedData: {
      DatabaseConstants.title: taskModel.title,
      DatabaseConstants.time: taskModel.time,
      DatabaseConstants.date: taskModel.date,
      DatabaseConstants.colorValue: taskModel.colorValue
    }).then((value) {
      emit(UpdateTaskSuccess());
    }).catchError((e) {
      log('error in updateTask ${e.toString()}');
      emit(UpdateTaskFailure(message: AppConstants.updateTaskFailure));
    });
  }

  deleteTask({required int id}) {
    databaseHelper
        .deleteData(id: id)
        .then(
          (value) => emit(DeleteTaskSuccess()),
        )
        .catchError((e) {
      log('error in deleteTask ${e.toString()}');
      emit(DeleteTaskFailure(message: AppConstants.deleteTaskFailure));
    });
  }
}
