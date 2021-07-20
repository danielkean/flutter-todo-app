import 'package:flutter_todo_app/model/todo.dart';

List<Todo> todos = [];

void populateData() {
  for (var i = 0; i < 1000; i++) {
    todos.add(Todo());
  }
}
