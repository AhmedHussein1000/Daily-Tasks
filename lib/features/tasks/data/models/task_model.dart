import 'package:equatable/equatable.dart';
import 'package:todo_app/core/local_database/database_constants.dart';

class TaskModel extends Equatable {
  final int id;
  final String title;
  final String time;
  final String date;
  final int colorValue;
  final String status;
  const TaskModel(
      {required this.id,
      required this.title,
      required this.time,
      required this.date,
      required this.colorValue,
      required this.status});
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json[DatabaseConstants.id],
      title: json[DatabaseConstants.title],
      time: json[DatabaseConstants.time],
      date: json[DatabaseConstants.date],
      status: json[DatabaseConstants.status],
      colorValue: json[DatabaseConstants.colorValue],
    );
  }
 

  @override
  List<Object?> get props => [id];
}
