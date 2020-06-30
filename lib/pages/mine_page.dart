import 'package:flutter/material.dart';
import 'package:flutterstudy/generated/l10n.dart';

class MinePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).title),),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        color: Colors.white,
        child: Text('_items[index].name',
          style: TextStyle(fontSize: 16,),
        ),
      ),
    );
  }

}