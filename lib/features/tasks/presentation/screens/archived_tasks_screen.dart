import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/widgets/tasks_appbar.dart';
import 'package:todo_app/features/tasks/presentation/widgets/tasks_widgets/tasks_list_bloc_builder.dart';

class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TasksAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: const SizedBox(
              height: 20,
            ),
          ),
          TasksListBlocBuilder(status: AppConstants.archived,),],
      ),
    );
  }
}
