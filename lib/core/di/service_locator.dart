import 'package:get_it/get_it.dart';
import 'package:todo_app/core/local_database/database_helper.dart';

final GetIt getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerLazySingleton<DatabaseHelper>(
    () => DatabaseHelper(),
  );
}
