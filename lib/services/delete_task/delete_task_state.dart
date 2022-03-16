part of 'delete_task_bloc.dart';

@immutable
abstract class DeleteTaskState extends Equatable {
  const DeleteTaskState();
  @override
  List<Object> get props => [];
}

class DeleteTaskInitialState extends DeleteTaskState {}

class DeleteTaskSuccessState extends DeleteTaskState {
  final int timestamp;

  const DeleteTaskSuccessState({
    required this.timestamp,
  });

  @override
  List<Object> get props => [
        timestamp,
      ];
}
