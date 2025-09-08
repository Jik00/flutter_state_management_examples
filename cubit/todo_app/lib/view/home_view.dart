import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/controllers/task_cubit.dart';
import 'package:todo_app/controllers/task_cubit_state.dart';
import 'package:todo_app/widgets/add_task.dart';
import 'package:todo_app/widgets/tasks_listview.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocBuilder<TaskCubit, TaskCubitState>(
          builder: (context, state) {
            return Column(
              children: [
                AddTaskWidget(),
                Expanded(
                  child: TasksListview(tasksList: state.tasksList),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
