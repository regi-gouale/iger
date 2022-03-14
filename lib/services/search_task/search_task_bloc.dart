import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_task_event.dart';
part 'search_task_state.dart';

class SearchTaskBloc extends Bloc<SearchTaskEvent, SearchTaskState> {
  SearchTaskBloc() : super(SearchTaskInitial()) {
    on<SearchTaskEvent>((event, emit) {
    });
  }
}
