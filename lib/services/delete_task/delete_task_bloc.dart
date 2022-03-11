import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'delete_task_event.dart';
part 'delete_task_state.dart';

class DeleteTaskBloc extends Bloc<DeleteTaskEvent, DeleteTaskState> {
  DeleteTaskBloc() : super(DeleteTaskInitial()) {
    on<DeleteTaskEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
