import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Todo.dart';
import 'TodoBloc.dart';

class AddTodoPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Todo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: _controller, decoration: InputDecoration(labelText: 'Todo')),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final todoTitle = _controller.text;
                if (todoTitle.isNotEmpty) {
                  print("Current Context: $context");
                  context.read<TodoBloc>().add(AddTodo(Todo(todoTitle)));
                  Navigator.pop(context);
                }
              },
              child: Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
