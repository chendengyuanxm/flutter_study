import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('AB'),
              ),
              label: Text('Chip'),
              deleteIcon: Icon(Icons.delete_outline),
              onDeleted: (){},
              elevation: 5,
              clipBehavior: Clip.hardEdge,
            ),

            InputChip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('AB'),
              ),
              label: Text('InputChip'),
              onSelected: (selected) {
                print('onSelected:$selected');
              },
            ),

            FilterChip(
//              avatar: CircleAvatar(
//                child: Text('AB'),
//              ),
              label: Text('FilterChip'),
              selected: true,
              onSelected: (selected) {
                print('onSelected:$selected');
              },
            ),

            ActionChip(
              label: Text('ActionChip'),
              onPressed: () {
                print('onPressed');
              },
            ),

            RawChip(
              label: Text('RawChip'),
            ),

            Divider(),

            LinearProgressIndicator(),
            CircularProgressIndicator(),
            RefreshIndicator(
              child: Container(
                height: 50,
                color: Colors.black26,
              ),
              onRefresh: (){},
            ),

            RepaintBoundary(),
          ],
        ),
      ),
    );
  }
}
