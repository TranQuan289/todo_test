import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_test/page/create/new_todo_page.dart';
import '../../model/todo_model.dart';
import '../create/bloc/todo_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      if (state is TodoLoading) {
        return const CircularProgressIndicator();
      }
      if (state is ToDoLoaded) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            centerTitle: true,
          ),
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
              return _card(context, state.todos[index]);
            },
          ),
        );
      } else {
        return const Text("Error");
      }
    });
  }

  Row _card(BuildContext context, Todo todo) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        todo.favarite
            ? IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  todo.favarite = !todo.favarite;
                  context
                      .read<TodoBloc>()
                      .add(ChangeFavorive(isChange: todo.favarite));
                },
              )
            : IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {
                  todo.favarite = !todo.favarite;
                  context
                      .read<TodoBloc>()
                      .add(ChangeFavorive(isChange: todo.favarite));
                }),
        const SizedBox(
          width: 40,
          height: 40,
        ),
        Text(
          todo.title,
        )
      ],
    );
  }
}
