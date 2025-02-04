import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/themes/app_colors.dart';
import 'package:todo_app/core/themes/app_styles.dart';
import 'package:todo_app/core/widgets/custom_text_form_field.dart';
import 'package:todo_app/features/tasks/presentation/controllers/todo_tasks_cubit/todo_tasks_cubit.dart';
import 'package:todo_app/features/tasks/presentation/widgets/addTaskWidgets/colors_list.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController titleController;
  late final TextEditingController timeController;
  late final TextEditingController dateController;
  int colorIndex = 0;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    timeController = TextEditingController();
    dateController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    timeController.dispose();
    dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: Styles.styleSemiBold20(context),
                ),
                CustomTextformfield(
                  hintText: 'Task title',
                  controller: titleController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Start Time',
                  style: Styles.styleSemiBold20(context),
                ),
                CustomTextformfield(
                  hintText: 'Starting time',
                  controller: timeController,
                  readOnly: true,
                  onTap: () {
                    pickTime(context).then(
                      (value) {
                        if (value != null) {
                          if (!context.mounted) return;
                          timeController.text =
                              value.format(context).toString();
                        }
                      },
                    );
                  },
                  suffixIcon: const Icon(Icons.schedule),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Date',
                  style: Styles.styleSemiBold20(context),
                ),
                CustomTextformfield(
                  hintText: 'Task date',
                  controller: dateController,
                  readOnly: true,
                  onTap: () {
                    pickDate(context).then(
                      (value) {
                        dateController.text = DateFormat.yMMMd()
                            .format(value ?? DateTime.now())
                            .toString();
                      },
                    );
                  },
                  suffixIcon: const Icon(Icons.calendar_today),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
          ColorsList(
            onColorChanged: (index) => colorIndex = index,
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<TodoTasksCubit>().addTask(
                            title: titleController.text,
                            time: timeController.text,
                            date: dateController.text,
                            colorValue: AppColors.tasksColors[colorIndex].value,
                          );
                    }
                  },
                  child: Text(
                    'Add Task',
                    style: Styles.styleSemiBold18(context),
                  )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Future<DateTime?> pickDate(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );

  Future<TimeOfDay?> pickTime(BuildContext context) =>
      showTimePicker(context: context, initialTime: TimeOfDay.now());
}
