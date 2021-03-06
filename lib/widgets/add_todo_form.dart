import 'package:flutter/material.dart';
import 'package:flutter_todo_app/api/firestore.dart';
import 'package:flutter_todo_app/model/todo.dart';
import 'package:flutter_todo_app/utils/utils.dart';

class AddTodoForm extends StatefulWidget {
  const AddTodoForm({Key? key}) : super(key: key);

  @override
  _AddTodoFormState createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  void initState() {
    super.initState();
    titleController.addListener(() => setState(() {}));
    descriptionController.addListener(() => setState(() {}));
  }

  void addTask() {
    if (formKey.currentState!.validate() == false) return;

    // Add Todo to Firestore
    Firestore.add(
      Todo(
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        isCompleted: false,
        dateCreated: DateTime.now().toString(),
      ),
    );

    // Return to previous page
    Navigator.of(context).pop();

    // Show snackbar
    Utils.showSnackBar(
      context: context,
      text: "Todo task has been added.",
      colour: Colors.green,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: titleController,
            textCapitalization: TextCapitalization.sentences,
            maxLength: 30,
            autofocus: true,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (v) {
              FocusScope.of(context).nextFocus();
            },
            decoration: InputDecoration(
              labelText: "Title",
              suffixIcon: (titleController.text.isEmpty)
                  ? Container(width: 0)
                  : IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => titleController.clear(),
                    ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().length == 0) {
                return "Please enter a title...";
              }
              return null;
            },
          ),
          TextFormField(
            controller: descriptionController,
            textCapitalization: TextCapitalization.sentences,
            maxLength: 60,
            decoration: InputDecoration(
              labelText: "Description",
              suffixIcon: (descriptionController.text.isEmpty)
                  ? Container(width: 0)
                  : IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => descriptionController.clear(),
                    ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().length == 0) {
                return "Please enter a description...";
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text("Add Todo"),
            onPressed: addTask,
          ),
        ],
      ),
    );
  }
}
