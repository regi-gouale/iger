import 'package:bloc/bloc.dart';
import 'package:iger/repositories/task_repository.dart';
import 'package:meta/meta.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  final TaskRepository taskRepository;
  AddTaskBloc({required this.taskRepository}) : super(AddTaskInitial()) {
    on<AddTaskEvent>((event, emit) {});
  }
}
