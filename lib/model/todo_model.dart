import 'package:uuid/uuid.dart';

class Todo {
  Todo({required this.favarite, required this.title});
  bool favarite;
  final String title;
  final String id = const Uuid().v4();
}

List<Todo> listTodo = [
  Todo(
    favarite: true,
    title: "Home Page",
  ),
  Todo(favarite: false, title: "Favorite Page"),
  Todo(
    favarite: true,
    title: "New Home Page",
  ),
];
