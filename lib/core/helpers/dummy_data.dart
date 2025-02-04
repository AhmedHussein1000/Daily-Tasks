import 'package:todo_app/features/tasks/data/models/task_model.dart';

abstract class DummyData {
  static const TaskModel _taskModel = TaskModel(
      id: 1,
      title: 'go to gym',
      time: '00:00',
      date: '00-00-00',
      colorValue: 0xffffff,
      status: 'new');

  static List<TaskModel> getDummytasks()=> List.generate(5, (index) => _taskModel);
}
