import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/main_page.dart';
import 'package:provider/provider.dart';

import 'provider/index.dart';

void main() {
//  debugPaintLayerBordersEnabled = true;
//  debugRepaintRainbowEnabled = true;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CartModel>.value(value: CartModel()),
        ChangeNotifierProvider<TabIndex>.value(value: TabIndex()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
