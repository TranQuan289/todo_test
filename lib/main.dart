import 'package:flutter/material.dart';
import 'package:todo_test/bloc/todo_bloc.dart';
import 'package:todo_test/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test/model/todo_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TodoBloc()..add(LoadTodos(todos: listTodo)),
          ),
        ],
        child: const MaterialApp(
          home: Home(),
        ));
  }
}
