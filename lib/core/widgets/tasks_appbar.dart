import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/themes/app_styles.dart';
import 'package:todo_app/core/cubits/theme_cubit/theme_cubit.dart';

class TasksAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TasksAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Colors.deepOrange,
              Colors.orange,
              Colors.amber,
              Colors.redAccent
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.25, 0.5, 0.75, 1]).createShader(bounds),
        blendMode: BlendMode.srcIn,
        child: Text(
          'Daily Tasks',
          style: Styles.styleSemiBold20(context),
        ),
      ),
      actions: [
        BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, state) {
            return IconButton(
                onPressed: () {
                  context.read<ThemeCubit>().changeTheme();
                },
                icon: state == ThemeMode.light
                    ? const Icon(Icons.dark_mode)
                    : const Icon(Icons.brightness_6));
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
