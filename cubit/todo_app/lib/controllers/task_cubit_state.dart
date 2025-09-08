import 'package:equatable/equatable.dart';
import 'package:todo_app/models/task_model.dart';

sealed class TaskCubitState extends Equatable {
  final List<TaskModel> tasksList;

  const TaskCubitState({required this.tasksList});

  @override
  List<Object?> get props => [tasksList];
}

final class TaskInitial extends TaskCubitState {
  TaskInitial() : super(tasksList: []);
}

final class UpdateTask extends TaskCubitState {
  const UpdateTask({required super.tasksList});
}
