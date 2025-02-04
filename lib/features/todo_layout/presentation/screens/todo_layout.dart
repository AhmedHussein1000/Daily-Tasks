import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:todo_app/core/functions/show_toast.dart';
import 'package:todo_app/core/helpers/extensions.dart';
import 'package:todo_app/core/routes/routes.dart';
import 'package:todo_app/core/utils/enums.dart';
import 'package:todo_app/features/tasks/presentation/controllers/todo_tasks_cubit/todo_tasks_cubit.dart';
import 'package:todo_app/features/tasks/presentation/screens/archived_tasks_screen.dart';
import 'package:todo_app/features/tasks/presentation/screens/done_tasks_screen.dart';
import 'package:todo_app/features/tasks/presentation/screens/new_tasks_screen.dart';
import 'package:todo_app/features/todo_layout/data/models/nav_bar_item_model.dart';

class TodoLayout extends StatefulWidget {
  const TodoLayout({super.key});

  @override
  State<TodoLayout> createState() => _TodoLayoutState();
}

class _TodoLayoutState extends State<TodoLayout> {
  late final PersistentTabController _persistentTabController;

  List<Widget> screens = const [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen()
  ];
  @override
  void initState() {
    _persistentTabController = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    _persistentTabController.dispose();
    super.dispose();
  }

  PersistentBottomNavBarItem _getBottomNavBarItem(
      {required NavBarItemModel navbarItemModel}) {
    return PersistentBottomNavBarItem(
        icon: navbarItemModel.icon,
        title: navbarItemModel.title,
        textStyle: const TextStyle(fontWeight: FontWeight.w500),
        activeColorPrimary: navbarItemModel.activeColorPrimary,
        inactiveColorPrimary: navbarItemModel.inactiveColorPrimary);
  }

  List<PersistentBottomNavBarItem> getItems() => navBarItems
      .map(
        (navBarItem) => _getBottomNavBarItem(navbarItemModel: navBarItem),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoTasksCubit, TodoTasksState>(
      listener: (context, state) {
        if (state is DeleteTaskSuccess) {
          context.read<TodoTasksCubit>().getTasks();
        }
        if (state is DeleteTaskFailure) {
          customToast(message: state.message, state: ToastStates.error);
        }
        if(state is ChangeTaskStateFailure){
          customToast(message: state.message, state: ToastStates.error);
        }
        if(state is ChangeTaskStateSuccess){
          context.read<TodoTasksCubit>().getTasks();
        }
      },
      child: PersistentTabView(
        context,
        screens: screens,
        controller: _persistentTabController,
        items: getItems(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        navBarStyle: NavBarStyle.style6,
        resizeToAvoidBottomInset: true,
        decoration: NavBarDecoration(
          colorBehindNavBar: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 7,
              offset: Offset(0, -2),
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        padding: const EdgeInsets.only(top: 5),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              context.pushNamed(Routes.addNewTask);
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
