import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iger/models/task_model.dart';
import 'package:iger/repositories/task_repository.dart';
import 'package:meta/meta.dart';

part 'list_task_event.dart';
part 'list_task_state.dart';

class ListTaskBloc extends Bloc<ListTaskEvent, ListTaskState> {
  final TaskRepository taskRepository;

  ListTaskBloc({required this.taskRepository})
      : super(
          ListTaskInitialState(
            taskModel: List<TaskModel>.from([]),
          ),
        ) {
    taskRepository.tasks.listen((tasks) {
      add(_OnTaskUpdatedListTaskEvent(tasks: tasks));
    });

    on<OnInitializeListTaskEvent>((event, emit) async {
      await taskRepository.initialize();
    });

    on<_OnTaskUpdatedListTaskEvent>(
      (event, emit) {
        emit(
          ListTaskInitialState(
            taskModel: event.tasks,
          ),
        );
      },
    );
  }
}
