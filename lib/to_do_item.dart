class TodoItem {
  String name = "";
  bool isConfirmed;

  TodoItem({
    required this.name,
    this.isConfirmed = false,
  });
}

List<TodoItem> todos = [];
