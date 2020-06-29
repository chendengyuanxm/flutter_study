import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/grid_paper_test_page.dart';
import 'package:flutterstudy/pages/safe_area_test_page.dart';
import 'package:flutterstudy/pages/unbounded_test_page.dart';
import 'package:flutterstudy/utils/index.dart';

class PageItem {
  final String name;
  final Widget page;

  PageItem({this.name, this.page});
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  static List<PageItem> _items;

  @override
  void initState() {
    super.initState();
    _initPageitems();
  }

  _initPageitems() {
    _items = [
      PageItem(name: 'SafeAreaTestPage', page: SafeAreaTestPage()),
      PageItem(name: 'UnboundedWidgetTestPage', page: UnboundedWidgetTestPage()),
      PageItem(name: 'GridPaperTestPage', page: GridPaperTestPage()),
    ];
  }

  _onItemClick(int index) {
    Widget page = _items[index].page;
    RouteUtil.pushPage(context, page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: _items != null ? _items.length : 0,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _onItemClick(index),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  color: Colors.white,
                  child: Text(_items[index].name,
                    style: TextStyle(fontSize: 16,),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}