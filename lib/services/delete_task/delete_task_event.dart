part of 'delete_task_bloc.dart';

abstract class DeleteTaskEvent extends Equatable {
  const DeleteTaskEvent();
}

class OnDeleteTaskEvent extends DeleteTaskEvent {
  final TaskModel taskModel;

  const OnDeleteTaskEvent({required this.taskModel});

  @override
  List<Object?> get props => [
        taskModel,
      ];
}
