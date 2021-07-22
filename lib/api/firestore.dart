import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo_app/model/todo.dart';

class Firestore {
  static Future add(Todo todo) async {
    FirebaseFirestore.instance.collection('todos').add(todo.toJson());
  }

  static Future update(String id, Todo todo) async {
    final doc = FirebaseFirestore.instance.collection('todos').doc(id);
    await doc.update(todo.toJson());
  }

  static Future delete(Todo todo) async {
    final doc = FirebaseFirestore.instance.collection('todos').doc(todo.id);
    await doc.delete();
  }

  static void populateData() {
    for (var i = 0; i < 1000; i++) {
      Firestore.add(
        Todo(
          title: "TasK: $i",
          description: "Description: $i",
          isCompleted: (i % 2 == 0) ? true : false,
          dateCreated: DateTime.now().toString(),
        ),
      );
    }
  }
}
