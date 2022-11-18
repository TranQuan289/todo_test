import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/todo_model.dart';
import '../create/bloc/todo_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      if (state is TodoLoading) {
        return const CircularProgressIndicator();
      }
      if (state is ToDoLoaded) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Favorite'),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              if (state.todos[index].favarite) {
                return _card(context, state.todos[index]);
              } else {
                return const SizedBox();
              }
            },
          ),
        );
      } else {
        return Container();
      }
    });
  }

  Row _card(BuildContext context, Todo todo) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        IconButton(
            icon: const Icon(Icons.favorite),
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
        Text(todo.title)
      ],
    );
  }
}
