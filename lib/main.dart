import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/di/service_locator.dart';
import 'package:todo_app/core/helpers/cache_helper.dart';
import 'package:todo_app/core/routes/app_router.dart';
import 'package:todo_app/core/routes/routes.dart';
import 'package:todo_app/core/themes/dark_theme.dart';
import 'package:todo_app/core/themes/light_theme.dart';
import 'package:todo_app/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:todo_app/custom_bloc_observer.dart';
import 'package:todo_app/features/tasks/presentation/controllers/todo_tasks_cubit/todo_tasks_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await CacheHelper.init();
  Bloc.observer = CustomBlocObserver();
  runApp(BlocProvider(
    create: (context) => ThemeCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoTasksCubit(getIt())..getTasks(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: context.watch<ThemeCubit>().state,
        onGenerateRoute: AppRouter().generateRoute,
        initialRoute: Routes.todoLayout,
      ),
    );
  }
}
