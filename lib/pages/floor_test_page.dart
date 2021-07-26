import 'package:flutter/material.dart';
import 'package:flutterstudy/db/dao/database.dart';
import 'package:flutterstudy/db/dao/db_service.dart';
import 'package:flutterstudy/model/user.dart';

class FloorTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FloorTestState();

}

class _FloorTestState extends State<FloorTestPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(DatabaseService.userDao);
    return Scaffold(
      appBar: AppBar(title: Text('floor DB Test'),),
      body: Container(
        child: StreamBuilder<List<User>>(
          stream: DatabaseService.userDao.findAllUserAsStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();

            List<User> users = snapshot.data!;
            return ListView.builder(
              itemBuilder: (context, index) {
                return Text(users[index].combinedName);
              },
              itemCount: users.length,
            );
          },
        ),
      ),
    );
  }

}