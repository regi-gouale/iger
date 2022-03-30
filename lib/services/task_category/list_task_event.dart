part of 'list_task_bloc.dart';

@immutable
abstract class TaskCategoryEvent extends Equatable {
  const TaskCategoryEvent();

  @override
  List<Object?> get props => [];
}

class OnInitializeTaskCategoryEvent extends TaskCategoryEvent {}

class _OnTaskUpdatedTaskCategoryEvent extends TaskCategoryEvent {
  final List<TaskModel> tasks;

  const _OnTaskUpdatedTaskCategoryEvent({required this.tasks});

  @override
  List<Object?> get props => [
        tasks,
      ];
}
