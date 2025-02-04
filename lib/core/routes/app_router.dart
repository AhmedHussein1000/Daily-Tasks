import 'package:flutter/material.dart';
import 'package:todo_app/core/routes/routes.dart';
import 'package:todo_app/core/widgets/no_route_defined_screen.dart';
import 'package:todo_app/features/tasks/presentation/screens/add_task_screen.dart';
import 'package:todo_app/features/tasks/presentation/screens/archived_tasks_screen.dart';
import 'package:todo_app/features/tasks/presentation/screens/done_tasks_screen.dart';
import 'package:todo_app/features/tasks/presentation/screens/new_tasks_screen.dart';
import 'package:todo_app/features/todo_layout/presentation/screens/todo_layout.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.todoLayout:
        return MaterialPageRoute(
          builder: (_) => const TodoLayout(),
        );
      case Routes.addNewTask:
        return MaterialPageRoute(
          builder: (_) => const AddTaskScreen(),
        );
      case Routes.newTasks:
        return MaterialPageRoute(
          builder: (_) => NewTasksScreen(),
        );
      case Routes.archivedTasks:
        return MaterialPageRoute(
          builder: (_) => const ArchivedTasksScreen(),
        );
      case Routes.doneTasks:
        return MaterialPageRoute(
          builder: (_) => const DoneTasksScreen(),
        );

      default:
        return MaterialPageRoute(builder: (_) => const NoRouteDefinedScreen());
    }
  }
}
