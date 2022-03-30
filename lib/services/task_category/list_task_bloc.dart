import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iger/models/task_model.dart';
import 'package:iger/repositories/task_repository.dart';
import 'package:meta/meta.dart';

part 'list_task_event.dart';
part 'list_task_state.dart';

class TaskCategoryBloc extends Bloc<TaskCategoryEvent, TaskCategoryState> {
  final TaskRepository taskRepository;

  TaskCategoryBloc({required this.taskRepository})
      : super(
          TaskCategoryInitialState(
            taskModel: List<TaskModel>.from([]),
          ),
        ) {
    taskRepository.tasks.listen((tasks) {
      add(_OnTaskUpdatedTaskCategoryEvent(tasks: tasks));
    });

    on<OnInitializeTaskCategoryEvent>((event, emit) async {
      await taskRepository.initialize();
    });

    on<_OnTaskUpdatedTaskCategoryEvent>(
      (event, emit) {
        emit(
          TaskCategoryInitialState(
            taskModel: event.tasks,
          ),
        );
      },
    );
  }
}
