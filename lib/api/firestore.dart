import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo_app/model/todo.dart';

class Firestore {
  static Future add(Todo todo) async {
    final document = FirebaseFirestore.instance.collection('todos').doc();
    todo.id = document.id;
    await document.set(todo.toJson());
  }

  static Future update(String id, Todo todo) async {
    final doc = FirebaseFirestore.instance.collection('todos').doc(id);
    await doc.update(todo.toJson());
  }

  static Future delete(Todo todo) async {
    final doc = FirebaseFirestore.instance.collection('todos').doc(todo.id);
    await doc.delete();
  }
}
