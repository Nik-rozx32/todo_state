import 'package:flutter/material.dart';
import 'dart:math';
import '../models/todo.dart';

class TodoProvider with ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(String text) {
    if (text.isEmpty) return;
    _todos.add(Todo(id: Random().nextDouble().toString(), text: text));
    notifyListeners();
  }

  void toggleTodo(Todo todo) {
    todo.toggleDone();
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}
