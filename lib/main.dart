import 'package:flutter/material.dart';
import 'package:flutter_crud/screen/add_screen.dart';
import 'package:flutter_crud/screen/list_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Crud Api",
      home: ListData(),
      routes: {
        '/home' : (context) => ListData(),
        '/add-data' : (context) => AddData(),
      },
    );
  }
}