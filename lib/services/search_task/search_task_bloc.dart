import 'package:bloc/bloc.dart';
import 'package:iger/repositories/task_repository.dart';
import 'package:meta/meta.dart';

part 'search_task_event.dart';
part 'search_task_state.dart';

class SearchTaskBloc extends Bloc<SearchTaskEvent, SearchTaskState> {
  final TaskRepository taskRepository;
  SearchTaskBloc({
    required this.taskRepository,
  }) : super(SearchTaskInitial()) {
    on<SearchTaskEvent>((event, emit) {});
  }
}
