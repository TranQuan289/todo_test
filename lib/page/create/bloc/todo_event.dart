part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class LoadTodos extends TodoEvent {
  final List<Todo> todos;
  const LoadTodos({required this.todos});
  @override
  List<Object> get props => [todos];
}

class AddTodo extends TodoEvent {
  final Todo todo;
  const AddTodo({required this.todo});
  @override
  List<Object> get props => [todo];
}

class ChangeFavorive extends TodoEvent {
  final bool isChange;
  const ChangeFavorive({required this.isChange});
}
