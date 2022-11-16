import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test/bloc/todo_bloc.dart';

import '../model/todo_model.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc()..add(LoadFavoriteTodos(todos: listTodo)),
      child: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
        if (state is TodoLoading) {
          return const CircularProgressIndicator();
        }
        if (state is ToDoLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Favorite'),
              centerTitle: true,
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
        IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              setState(() {
                todo.favarite = !todo.favarite;
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
