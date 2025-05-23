import 'package:flutter/material.dart';
import 'package:todo_states/home_page.dart';
import 'package:provider/provider.dart';
import 'provider/todo_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TodoProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoList(),
    );
  }
}
