part of 'todo_tasks_cubit.dart';

sealed class TodoTasksState {
  const TodoTasksState();
}

final class TasksInitial extends TodoTasksState {}

// add Task states
final class AddTaskLoading extends TodoTasksState {}

final class AddTaskSuccess extends TodoTasksState {
  final String message;

  const AddTaskSuccess({required this.message});
}

final class AddTaskFailure extends TodoTasksState {
  final String message;

  const AddTaskFailure({required this.message});
}

// get Tasks states
final class GetTasksLoading extends TodoTasksState {}

final class GetTasksSuccess extends TodoTasksState {
  final List<TaskModel> allTasks;

  GetTasksSuccess({required this.allTasks});
}

final class GetTasksFailure extends TodoTasksState {
  final String message;

  const GetTasksFailure({required this.message});
}

// change Task status states
final class ChangeTaskStateLoading extends TodoTasksState {}

final class ChangeTaskStateSuccess extends TodoTasksState {}

final class ChangeTaskStateFailure extends TodoTasksState {
  final String message;

  const ChangeTaskStateFailure(this.message);
}

// update Task states
final class UpdateTaskLoading extends TodoTasksState {}

final class UpdateTaskSuccess extends TodoTasksState {}

final class UpdateTaskFailure extends TodoTasksState {
  final String message;

  const UpdateTaskFailure({required this.message});
}

// delete Task states

final class DeleteTaskSuccess extends TodoTasksState {}

final class DeleteTaskFailure extends TodoTasksState {
  final String message;

  const DeleteTaskFailure({required this.message});
}
