import 'package:flutter/material.dart';

class SafeAreaTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: Colors.black45,
        ),
      ),
    );
  }

}