import 'package:flutter/material.dart';
import 'package:todo_test/page/favorite_page.dart';
import 'package:todo_test/page/home_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

final List<Map<String, dynamic>> _pageDetails = [
  {'pageName': const HomePage(), 'title': 'Home'},
  {'pageName': const FavoritePage(), 'title': 'FavoritePage'},
];
var _selectPageIndex = 0;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_pageDetails[_selectPageIndex]['title']),
          centerTitle: true),
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
