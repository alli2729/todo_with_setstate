import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../widgets/todo_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const String route = '/';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //* Variables _______________________________________________________________
  int idMaker = 1;
  final List<Todo> _todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      floatingActionButton: _fab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: _body(),
    );
  }

  //* Widgets _________________________________________________________________

  Widget _fab() {
    return FloatingActionButton(
      onPressed: _addTodo,
      elevation: 0,
      hoverElevation: 0,
      child: const Icon(Icons.add),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      title: const Text('Todos'),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.separated(
        itemCount: _todos.length,
        itemBuilder: (_, index) => TodoWidget(
            todo: _todos[index],
            onDelete: () => _delete(_todos[index].id),
            onCheked: (value) => _onCheck(_todos[index].id, value)),
        separatorBuilder: (_, __) => const Divider(
          indent: 20,
          endIndent: 20,
        ),
      ),
    );
  }

  //* Methods _________________________________________________________________

  void _addTodo() {
    setState(() {
      _todos.add(Todo(
          id: idMaker,
          title: 'title $idMaker',
          description: 'description',
          isDone: false));
      ++idMaker;
    });
  }

  void _delete(int id) {
    int index = _todos.indexWhere((todo) => todo.id == id);
    setState(() => _todos.removeAt(index));
  }

  void _onCheck(int id, bool? newValue) {
    int index = _todos.indexWhere((todo) => todo.id == id);
    Todo newTodo = _todos[index].copyWith(null, null, null, newValue);
    setState(() => _todos[index] = newTodo);
  }
}
