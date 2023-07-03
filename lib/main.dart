import 'package:flutter/material.dart';
import 'HomePage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: "Task Manager",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
