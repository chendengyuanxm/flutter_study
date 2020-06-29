import 'package:flutter/material.dart';

class GridPaperTestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: GridView.builder(
          itemBuilder: (context, index) {
            return GridPaper(
              child: Text('aaaa'),
            );
          },
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
        ),
      ),
    );
  }

}