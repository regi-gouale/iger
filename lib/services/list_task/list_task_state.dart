part of 'list_task_bloc.dart';

@immutable
abstract class ListTaskState extends Equatable {
  const ListTaskState();

  @override
  List<Object?> get props => [];
}

class ListTaskInitialState extends ListTaskState {
  final List<TaskModel> taskModel;

  const ListTaskInitialState({
    required this.taskModel,
  });

  @override
  List<Object?> get props => [
        taskModel,
      ];
}
