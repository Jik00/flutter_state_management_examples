import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/controllers/task_cubit.dart';
import 'package:todo_app/models/task_model.dart';

class TasksListview extends StatelessWidget {
  const TasksListview({super.key, required this.tasksList});

  final List<TaskModel> tasksList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final task = tasksList[index];
        return ListTile(
          title: Text(task.title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                  value: task.isCompleted,
                  onChanged: (value) {
                    context.read<TaskCubit>().toggleTask(task.id);
                  }),
              IconButton(
                  onPressed: () {
                    context.read<TaskCubit>().removeTask(task.id);
                  },
                  icon: const Icon(Icons.delete)),
            ],
          ),
        );
      },
      itemCount: tasksList.length,
    );
  }
}
