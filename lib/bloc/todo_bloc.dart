import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoLoading()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
  }
  TextEditingController titleController = TextEditingController();
  _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) {
    emit(ToDoLoaded(todos: event.todos));
  }

  _onAddTodo(AddTodo event, Emitter<TodoState> emit) {
    final currentState = state;
    if (currentState is ToDoLoaded) {
      List<Todo> todos = List.from(currentState.todos)..add(event.todo);
      emit(ToDoLoaded(todos: todos));
    }
  }
}
