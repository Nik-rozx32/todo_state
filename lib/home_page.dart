import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/todo_provider.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo App')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Enter todo',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                IconButton(
                  onPressed: () {
                    Provider.of<TodoProvider>(context, listen: false)
                        .addTodo(_controller.text);
                    _controller.clear();
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<TodoProvider>(
              builder: (context, provider, _) {
                final todos = provider.todos;
                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return ListTile(
                      title: Text(
                        todo.text,
                        style: TextStyle(
                          decoration:
                              todo.isDone ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      leading: Checkbox(
                        value: todo.isDone,
                        onChanged: (_) => provider.toggleTodo(todo),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => provider.deleteTodo(todo),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
