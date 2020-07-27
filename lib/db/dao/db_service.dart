import 'package:flutterstudy/db/dao/database.dart';
import 'package:flutterstudy/db/dao/user_dao.dart';

class DatabaseService {
  static UserDao userDao;

  static initDataBase() async{
    final database = await $FloorAppDataBase.databaseBuilder('app_database.db').build();
    userDao = database.userDao;
  }
}