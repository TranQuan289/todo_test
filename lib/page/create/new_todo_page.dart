import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test/page/create/bloc/todo_bloc.dart';
import '../../model/todo_model.dart';

class NewTodoPage extends StatelessWidget {
  const NewTodoPage({Key? key}) : super(key: key);

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
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (BuildContext context, state) {
          final bloc = context.read<TodoBloc>();
          return Column(
            children: [
              TextField(
                  controller: bloc.titleController,
                  decoration: const InputDecoration(
                    hintText: "Title",
                  )),
              TextButton(
                  onPressed: () {
                    var todo = Todo(
                      favarite: false,
                      title: bloc.titleController.text,
                    );
                    bloc.add(AddTodo(todo: todo));
                    Navigator.pop(context);
                  },
                  child: const Text('Save'))
            ],
          );
        },
      ),
    );
  }
}
