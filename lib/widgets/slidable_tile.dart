import 'package:flutter/material.dart';
import 'package:flutter_todo_app/api/firestore.dart';
import 'package:flutter_todo_app/model/todo.dart';
import 'package:flutter_todo_app/utils/utils.dart';

class SlidableTile extends StatelessWidget {
  final Todo todo;

  const SlidableTile({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildListTile(context, todo);
  }

  Widget buildListTile(BuildContext context, Todo todo) {
    Color textColour = (todo.isCompleted) ? Colors.grey : Colors.black;
    TextDecoration textDecoration =
        (todo.isCompleted) ? TextDecoration.lineThrough : TextDecoration.none;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (bool? value) {
          Firestore.update(
            todo.id,
            Todo(
              title: todo.title,
              description: todo.description,
              dateCreated: todo.dateCreated,
              isCompleted: !todo.isCompleted,
            ),
          );
        },
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            todo.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColour,
              decorationColor: textColour,
              decorationStyle: TextDecorationStyle.solid,
              decoration: textDecoration,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            todo.description,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: textColour,
              decorationColor: textColour,
              decorationStyle: TextDecorationStyle.solid,
              decoration: textDecoration,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            todo.dateCreated,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              decorationColor: textColour,
              decorationStyle: TextDecorationStyle.solid,
              decoration: textDecoration,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          Firestore.delete(todo);
          Utils.showSnackBar(
            context: context,
            text: "Todo has been deleted.",
            colour: Colors.red,
          );
        },
      ),
    );
  }
}
