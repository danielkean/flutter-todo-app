import 'package:flutter/material.dart';
import 'package:flutter_todo_app/widgets/slidable_tile.dart';

import 'data/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter To-Do List App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MainPage(title: 'Flutter To-Do List App'),
    );
  }
}

class MainPage extends StatefulWidget {
  final String title;

  MainPage({Key? key, required this.title}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    populateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: todos.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return SlidableTile(todo: todos[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
    );
  }
}
