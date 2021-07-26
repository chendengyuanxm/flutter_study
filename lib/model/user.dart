import 'package:floor/floor.dart';

@entity
class User {
  @primaryKey
  final int id;

  @ColumnInfo(name: 'name')
  final String name;

  @ignore
  String? nickname;

  String get combinedName => '$name ($nickname)';

  User(this.id, this.name);
}