import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/api/firestore.dart';
import 'package:flutter_todo_app/model/todo.dart';
import 'package:flutter_todo_app/widgets/slidable_tile.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter To-Do List App"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('todos')
            .orderBy("dateCreated")
            .snapshots(),
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot,
        ) {
          if (!snapshot.hasData) return const SizedBox.shrink();
          return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemCount: snapshot.data!.docs.length,
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
            ),
            itemBuilder: (BuildContext context, int index) {
              final document = snapshot.data!.docs[index];
              return SlidableTile(
                todo: Todo(
                  title: document['title'],
                  description: document['description'],
                  isCompleted: document['isCompleted'],
                  dateCreated: document['dateCreated'],
                  id: document.id,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Firestore.add(Todo(
            title: "Firestore Title",
            description: "description",
            isCompleted: false,
            dateCreated: DateTime.now().toString(),
          ))
        },
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
    );
  }
}
