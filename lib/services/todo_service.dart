import 'package:dio/dio.dart';
import 'package:todos_app/models/todo_model.dart';

String baseUrl = "https://jsonplaceholder.typicode.com";

class TodoService {
  String todosUrl = "$baseUrl/todos";
  Dio dio = Dio();
  Future<List<TodoModel>> getTodos(int pageNum) async {
    List<TodoModel> todoList = [];
    try {
      Response response = await dio.get(todosUrl);

      dynamic data = response.data;
      if (pageNum == 0) {
        // fetch first 100 todos
        for (int i = 0; i < 100; i++) {
          TodoModel todo = TodoModel.fromJson(data[i]);
          todoList.add(todo);
        }
      } else {
        // fetch sec 100 todos
        for (int i = 100; i < 200; i++) {
          TodoModel todo = TodoModel.fromJson(data[i]);
          todoList.add(todo);
        }
      }
    } catch (e) {
      print(e);
    }
    return todoList;
  }
}
