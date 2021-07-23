import 'package:flutter/material.dart';
import 'package:flutter_todo_app/widgets/add_todo_form.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: AddTodoForm(),
        ),
      ),
    );
  }
}
