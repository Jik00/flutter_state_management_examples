import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/controllers/task_cubit.dart';

class AddTaskWidget extends StatelessWidget {
  AddTaskWidget({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          maxLines: 2,
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter your task',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            if (controller.text.isEmpty) {
              return;
            }
            context.read<TaskCubit>().addTask(controller.text);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(70, 50),
          ),
          child: const Text(
            'Add Task',
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
