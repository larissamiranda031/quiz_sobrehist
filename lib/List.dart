// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";

void main() {
  runApp(todolist());
}

class todolist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To-Do List",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<String> _todosItens = [];  // controlador para o input de texto

  final TextEditingController _textController = TextEditingController();

  void _addTodoItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _todosItens.add(task);
      });

      _textController.clear(); // limpa o campo de trexto apos adicionar
    }
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todosItens.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('To-Do List'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        labelText: 'Escreva a Tarefa',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => _addTodoItem(_textController.text),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: _todosItens.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_todosItens[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _removeTodoItem(index),
                  ),
                );
              },
            )),
          ],
        ));
  }
}
