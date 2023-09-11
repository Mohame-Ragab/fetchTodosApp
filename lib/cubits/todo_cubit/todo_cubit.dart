import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todos_app/models/todo_model.dart';
import 'package:todos_app/services/todo_service.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());
  TodoService todoService = TodoService();
  List<TodoModel>? todoList;

  void getTodos(int pageNum) async {
    emit(TodoLoading());
    try {
      todoList = await todoService.getTodos(pageNum);
      emit(TodoSuccess());
    } catch (e) {
      emit(TodoFailure(errorMessage: e.toString()));
    }
  }
}
