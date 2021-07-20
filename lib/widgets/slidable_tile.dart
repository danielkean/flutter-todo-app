import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
      actionPane: SlidableDrawerActionPane(),
      child: buildListTile(widget.todo),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {},
        ),
      ],
      key: Key(widget.todo.title),
    );
  }

  Widget buildListTile(Todo todo) {
    Color textColour = (todo.isCompleted) ? Colors.grey : Colors.black;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (bool? value) {
          setState(() {
            todo.isCompleted = !todo.isCompleted;
          });
        },
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            todo.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColour,
              decorationColor: textColour,
              decorationStyle: TextDecorationStyle.solid,
              decoration: (todo.isCompleted)
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            todo.description,
            style: TextStyle(
              color: textColour,
              decorationColor: textColour,
              decorationStyle: TextDecorationStyle.solid,
              decoration: (todo.isCompleted)
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          //Text(todo.isCompleted ? "True" : "False"),
        ],
      ),
    );
  }
}
