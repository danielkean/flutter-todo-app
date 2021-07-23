import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todo_app/api/firestore.dart';
import 'package:flutter_todo_app/model/todo.dart';

class SlidableTile extends StatefulWidget {
  final Todo todo;

  const SlidableTile({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  _SlidableTileState createState() => _SlidableTileState();
}

class _SlidableTileState extends State<SlidableTile> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(widget.todo.title),
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            Firestore.delete(widget.todo);
          },
        ),
      ],
      child: buildListTile(widget.todo),
    );
  }

  Widget buildListTile(Todo todo) {
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
            widget.todo.id,
            Todo(
              title: widget.todo.title,
              description: widget.todo.description,
              dateCreated: widget.todo.dateCreated,
              isCompleted: !widget.todo.isCompleted,
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
    );
  }
}
