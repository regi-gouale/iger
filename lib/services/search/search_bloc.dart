import 'package:bloc/bloc.dart';
import 'package:iger/repositories/task_repository.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final TaskRepository taskRepository;
  SearchBloc({
    required this.taskRepository,
  }) : super(SearchInitial()) {
    on<SearchEvent>((event, emit) {});
  }
}
