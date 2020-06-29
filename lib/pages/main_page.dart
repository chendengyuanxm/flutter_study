import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/home_page.dart';
import 'package:flutterstudy/pages/mine_page.dart';
import 'package:flutterstudy/provider/index.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      title: Text('About'),
    ),
  ];
  final List<Widget> _pages = [
    HomePage(),
    MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Provider.of<TabIndex>(context).index,
        items: _items,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          Provider.of<TabIndex>(context).changeIndex(index);
        },
      ),
      body: _pages[Provider.of<TabIndex>(context).index],
    );
  }

}