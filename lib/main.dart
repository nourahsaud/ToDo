// import the flutter library
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/view/todo.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //create a text
      home: Todo(),
    );
  }
}
