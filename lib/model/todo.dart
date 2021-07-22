class Todo {
  String title;
  String description;
  bool isCompleted;
  String dateCreated;
  String id;

  Todo({
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.dateCreated,
    this.id = "-1",
  });

  static Todo fromJson(Map<String, dynamic> json) => Todo(
        title: json['title'],
        description: json['description'],
        isCompleted: json['isCompleted'],
        dateCreated: json['createdTime'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'isCompleted': isCompleted,
        'dateCreated': dateCreated,
        'id': id,
      };

  void printDetails() {
    print('------------------------');
    print('title: ${this.title}');
    print('description: ${this.description}');
    print('isCompleted: ${this.isCompleted}');
    print('isCompleted: ${this.dateCreated}');
    print('isCompleted: ${this.id}');
    print('------------------------');
  }
}
