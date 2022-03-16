import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iger/models/task_model.dart';
import 'package:iger/repositories/task_repository.dart';
import 'package:meta/meta.dart';

part 'delete_task_event.dart';
part 'delete_task_state.dart';

class DeleteTaskBloc extends Bloc<DeleteTaskEvent, DeleteTaskState> {
  final TaskRepository taskRepository;

  DeleteTaskBloc({
    required this.taskRepository,
  }) : super(DeleteTaskInitialState()) {
    on<OnDeleteTaskEvent>((event, emit) async {
      await taskRepository.removeTask(event.taskModel);
      emit(DeleteTaskSuccessState(
        timestamp: DateTime.now().microsecondsSinceEpoch,
      ));
    });
  }
}
