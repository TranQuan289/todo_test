part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoLoading extends TodoState {}

class ToDoLoaded extends TodoState {
  final List<Todo> todos;
  const ToDoLoaded({required this.todos});

  @override
  List<Object> get props => [todos];
}
