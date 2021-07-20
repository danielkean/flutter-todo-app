class Todo {
  String title, description;
  bool isCompleted;

  Todo({
    this.title = 'Title',
    this.description = 'Description',
    this.isCompleted = false,
  });

  void printDetails() {
    print('------------------------');
    print('title: ${this.title}');
    print('description: ${this.description}');
    print('isCompleted: ${this.isCompleted}');
    print('------------------------');
  }
}

void main() {
  Todo todo1 = Todo(
    title: 'Take out the rubbish',
    description: 'Put in the green bin.',
  );
  todo1.printDetails();
}
