import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterstudy/app.dart';
import 'package:flutterstudy/db/dao/database.dart';
import 'package:flutterstudy/db/dao/db_service.dart';
import 'package:flutterstudy/model/user.dart';
import 'package:flutterstudy/pages/main_page.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';
import 'provider/index.dart';

void main() {
//  debugPaintLayerBordersEnabled = true;
//  debugRepaintRainbowEnabled = true;

  WidgetsFlutterBinding.ensureInitialized();
  // _initDatabase();

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

_initDatabase() async{
  await DatabaseService.initDataBase();
  User user = User(1, 'arnold');
  DatabaseService.userDao.insertUser(user);
}

