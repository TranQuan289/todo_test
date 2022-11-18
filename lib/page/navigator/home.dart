import 'package:flutter/material.dart';
import 'package:todo_test/page/navigator/home_navigator_page.dart';
import 'package:todo_test/page/home/favorite_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

final List<Map<String, dynamic>> _pageDetails = [
  {
    'pageName': const HomeNavigatorPage(),
  },
  {'pageName': const FavoritePage()},
];
var _selectPageIndex = 0;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageDetails[_selectPageIndex]['pageName'],
      bottomSheet: BottomNavigationBar(
        currentIndex: _selectPageIndex,
        onTap: (value) {
          setState(() {
            _selectPageIndex = value;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
