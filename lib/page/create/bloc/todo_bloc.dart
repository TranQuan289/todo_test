import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../model/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoLoading(false, const [])) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<ChangeFavorive>(_onChangeFavorive);
  }
  TextEditingController titleController = TextEditingController();
  _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) {
    emit(ToDoLoaded(todos: event.todos));
  }

  _onAddTodo(AddTodo event, Emitter<TodoState> emit) {
    if (state is ToDoLoaded) {
      List<Todo> todos = List.from(state.todos)..add(event.todo);
      emit(ToDoLoaded(todos: todos));
    }
  }

  _onChangeFavorive(ChangeFavorive event, Emitter<TodoState> emit) {
    try {
      var currentState = state;
      if (state is ToDoLoaded) {
        currentState.isChange == event.isChange;
        emit(ToDoLoaded(todos: state.todos));
      }
    } catch (_) {}
  }
}
