// TodoBloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'Todo.dart';

class TodoState extends Equatable {
  final List<Todo> todos;

  const TodoState(this.todos);

  @override
  List<Object?> get props => [todos];
}

class TodoEvent {}

class AddTodo extends TodoEvent {
  final Todo todo;

  AddTodo(this.todo);
}

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState([]));

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is AddTodo) {
      final updatedTodos = List<Todo>.from(state.todos)..add(event.todo);
      yield TodoState(updatedTodos);
    }
  }
}
