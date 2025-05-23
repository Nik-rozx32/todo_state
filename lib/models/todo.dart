class Todo {
  String id;
  String text;
  bool isDone;

  Todo({required this.id, required this.text, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
