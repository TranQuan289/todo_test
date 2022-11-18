part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  final bool isChange;
  final List<Todo> todos;
  const TodoState(this.isChange, this.todos);

  @override
  List<Object> get props => [];
}

class TodoLoading extends TodoState {
  TodoLoading(bool bool, List list) : super(false, []);
}

class ToDoLoaded extends TodoState {
  const ToDoLoaded({required todos}) : super(false, todos);
  @override
  List<Object> get props => [todos];
}

class ChangLoaded extends TodoState {
  ChangLoaded({required bool isChange}) : super(isChange, []);
}

class ChangeError extends TodoState {
  const ChangeError(super.isChanged, super.todos);
}
