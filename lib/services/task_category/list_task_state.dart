part of 'list_task_bloc.dart';

@immutable
abstract class TaskCategoryState extends Equatable {
  const TaskCategoryState();

  @override
  List<Object?> get props => [];
}

class TaskCategoryInitialState extends TaskCategoryState {
  final List<TaskModel> taskModel;

  const TaskCategoryInitialState({
    required this.taskModel,
  });

  @override
  List<Object?> get props => [
        taskModel,
      ];
}
