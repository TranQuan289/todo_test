import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../bloc/todo_bloc.dart';
import '../model/todo_model.dart';

class NewTodoPage extends StatelessWidget {
  NewTodoPage({Key? key}) : super(key: key);
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text("New Todo"),
      ),
      body: BlocProvider(
        create: (context) => TodoBloc(),
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (BuildContext context, state) {
            final bloc = context.read<TodoBloc>();
            return Column(
              children: [
                TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      hintText: "Title",
                    )),
                TextButton(
                    onPressed: () {
                      var todo = Todo(
                        favarite: false,
                        title: titleController.text,
                      );
                      print(todo.title.toString());
                      bloc.add(AddTodo(todo: todo));
                      Navigator.pop(context);
                    },
                    child: const Text('Save'))
              ],
            );
          },
        ),
      ),
    );
  }
}
