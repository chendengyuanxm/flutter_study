import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:flutterstudy/db/dao/user_dao.dart';
import 'package:flutterstudy/model/user.dart';

part 'database.g.dart';

@Database(version: 1, entities: [User])
abstract class AppDataBase extends FloorDatabase {
  UserDao get userDao;
}