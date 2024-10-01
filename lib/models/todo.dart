class Todo {
  // Variable
  int id;
  String title;
  String description;
  bool isDone;

  // Constractor
  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.isDone,
  });

  // Methods
  Todo copyWith(
    int? id,
    String? title,
    String? description,
    bool? isDone,
  ) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }
}
