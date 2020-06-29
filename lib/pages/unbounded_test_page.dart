import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnboundedWidgetTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.teal,
        child: Column(
          children: <Widget>[
            Container(
              child: Text('aaaaaaaaaaaaaaa'),
            ),
            LimitedBox(
              maxHeight: 200,
              child: Container(
                height: 100,
                color: Colors.orange,
              ),
            ),
            RotatedBox(
              quarterTurns: 45,
              child: Container(
                height: 50,
                color: Colors.cyan,
              ),
            ),
//            OverflowBox(
//              maxHeight: 20,
//              maxWidth: 50,
//              child: Container(
//                color: Colors.red,
//                width: 50,
//              ),
//            ),
            Expanded(
              child: Container(
                color: Colors.amberAccent,
                child: Column(
                  children: <Widget>[
                    Text('aaaaaaa'),
                    Text('aaaaaaa'),
                    Text('aaaaaaa'),
                    Text('aaaaaaa'),
                    Text('aaaaaaa'),
                    Text('aaaaaaa'),
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
//            Flexible(
//              child: Column(
//                children: <Widget>[
//                  Container(
//                    height: 50,
//                    color: Colors.blue,
//                  ),
//                ],
//              ),
//            ),
//            Flexible(
//              flex: 1,
//              child: Container(
//                color: Colors.red,
//              ),
//            ),
//            Flexible(
//              flex: 2,
//              child: Container(
//                color: Colors.orange,
//                child: ListView.builder(
//                  itemCount: 10,
//                  itemBuilder: (context, index) {
//                    return Text('aaaa');
//                  },
//                ),
//              ),
//            ),
          ],
        ),
      ),
    );
  }

}