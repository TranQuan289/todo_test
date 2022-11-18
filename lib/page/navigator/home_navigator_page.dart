import 'package:flutter/material.dart';
import 'package:todo_test/page/create/new_todo_page.dart';

import '../home/home_page.dart';

class HomeNavigatorPage extends StatelessWidget {
  const HomeNavigatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (settings) {
          Widget page = const HomePage();
          if (settings.name == 'page2') page = const NewTodoPage();
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
    );
  }
}
