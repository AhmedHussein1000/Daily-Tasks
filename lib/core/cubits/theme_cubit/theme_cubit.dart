import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/helpers/cache_helper.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(_getThemeMode());
  static ThemeMode _getThemeMode() {
    final bool isDarkMode = CacheHelper.getData(CacheHelper.isDarkKey) ?? false;
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> changeTheme() async {
    final bool isDarkMode = state == ThemeMode.light;
    await CacheHelper.saveData(
        key: CacheHelper.isDarkKey, value: isDarkMode);

    emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }
}
