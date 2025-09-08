import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/controllers/task_cubit_state.dart';
import 'package:todo_app/models/task_model.dart';

class TaskCubit extends Cubit<TaskCubitState> {
  TaskCubit() : super(TaskInitial());

  addTask( String title) {
    TaskModel newTask = TaskModel(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      isCompleted: false,
    );
    emit(UpdateTask(tasksList: [...state.tasksList, newTask]));
  }

  removeTask(int taskId) {
    final updatedList = state.tasksList.where((task) => task.id != taskId).toList();
    emit(UpdateTask(tasksList: updatedList));
  }

  toggleTask( int taskId) {
    // map == iterate
    final updatedList = state.tasksList.map((task) {
      if (task.id == taskId) {
        return task.copyWith(isCompleted: !task.isCompleted);
      }
      return task;
    }).toList();
    emit(UpdateTask(tasksList: updatedList));
  }
}
