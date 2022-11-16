class Todo {
  Todo({required this.favarite, required this.title});
  bool favarite;
  final String title;
}

List<Todo> listTodo = [
  Todo(favarite: true, title: "Home Page"),
  Todo(favarite: false, title: "Favorite Page"),
  Todo(favarite: true, title: "New Home Page"),
];
