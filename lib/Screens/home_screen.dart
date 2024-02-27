import 'package:flutter/material.dart';
import 'package:sqflite_database/db_handler.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite Database"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await DBHandler().insertData(name: "test", age: 34);
                },
                child: Text("Insert")),
            ElevatedButton(
                onPressed: () async {
                  dynamic data = await DBHandler().readData();
                  print(data);
                },
                child: Text("Read"))
          ],
        ),
      ),
    );
  }
}
