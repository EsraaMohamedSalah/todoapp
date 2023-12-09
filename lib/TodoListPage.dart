import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'TodoBloc.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.todos.length,
          itemBuilder: (context, index) {
            final todo = state.todos[index];
            return ListTile(title: Text(todo.title));
          },
        );
      },
    );
  }
}
