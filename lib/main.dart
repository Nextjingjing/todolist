import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo List',
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<String> _todos = [];
  String _currentInput = '';

  void _addTodo() {
    if (_currentInput.isEmpty) return;
    
    setState(() {
      _todos.add(_currentInput);
    });
  }

  void _removeTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        backgroundColor: const Color.fromARGB(255, 0, 196, 230),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Todo List",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) {
                setState(() {
                  _currentInput = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Enter your text',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addTodo,
              child: const Text('Add Todo'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_todos[index]),
                    trailing: TextButton(
                      onPressed: () {
                        _removeTodo(index);
                      },
                      child: const Text('Delete', style: TextStyle(color: Colors.red)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
