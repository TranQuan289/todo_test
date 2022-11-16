import 'package:flutter/material.dart';
import 'package:todo_test/page/new_todo_page.dart';

import 'home.dart';
import 'page/home_page.dart';

class HomeNavigatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (settings) {
          Widget page = HomePage();
          if (settings.name == 'page2') page = NewTodoPage();
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
    );
  }
}
