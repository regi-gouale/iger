part of 'list_task_bloc.dart';

@immutable
abstract class ListTaskEvent extends Equatable {
  const ListTaskEvent();

  @override
  List<Object?> get props => [];
}

class OnInitializeListTaskEvent extends ListTaskEvent {}

class _OnTaskUpdatedListTaskEvent extends ListTaskEvent {
  final List<TaskModel> tasks;

  const _OnTaskUpdatedListTaskEvent({required this.tasks});

  @override
  List<Object?> get props => [
        tasks,
      ];
}
