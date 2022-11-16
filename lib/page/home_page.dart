import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test/bloc/todo_bloc.dart';
import 'package:todo_test/page/new_todo_page.dart';

import '../model/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc()..add(LoadTodos(todos: listTodo)),
      child: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
        if (state is TodoLoading) {
          return const CircularProgressIndicator();
        }
        if (state is ToDoLoaded) {
          return Scaffold(
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewTodoPage()));
                },
                child: const Icon(Icons.add),
              ),
            ),
            body: ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return _card(state.todos[index]);
              },
            ),
          );
        } else {
          return const Text("Error");
        }
      }),
    );
  }

  Row _card(Todo todo) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        todo.favarite
            ? IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  setState(() {
                    todo.favarite != todo.favarite;
                  });
                },
              )
            : IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {
                  setState(() {
                    todo.favarite != todo.favarite;
                  });
                }),
        const SizedBox(
          width: 40,
          height: 40,
        ),
        Text(todo.title)
      ],
    );
  }
}
