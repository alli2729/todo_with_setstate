import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({
    super.key,
    required this.todo,
    required this.onDelete,
    required this.onCheked,
  });

  final Todo todo;
  final void Function() onDelete;
  final void Function(bool?) onCheked;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _checkBox(),
        const SizedBox(width: 10),
        _titleAndDescription(),
        const Spacer(),
        _button(),
      ],
    );
  }

  //* Widgets _________________________________________________________________

  Widget _checkBox() {
    return Checkbox(
      value: todo.isDone,
      onChanged: onCheked,
      checkColor: Colors.white,
      activeColor: Colors.grey,
    );
  }

  Widget _button() {
    return IconButton(
      onPressed: onDelete,
      icon: const Icon(Icons.delete),
    );
  }

  Widget _titleAndDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(todo.title, style: _titleStyle()),
        Text(todo.description, style: _descriptionStyle()),
      ],
    );
  }

  //* Styles __________________________________________________________________

  TextStyle _titleStyle() {
    if (todo.isDone) {
      return TextStyle(
        color: Colors.grey[700],
        fontSize: 20,
        decoration: TextDecoration.lineThrough,
        decorationThickness: 1.5,
      );
    }
    return const TextStyle(fontSize: 20);
  }

  TextStyle _descriptionStyle() {
    if (todo.isDone) {
      return TextStyle(
        color: Colors.grey[800],
        fontSize: 12,
        decoration: TextDecoration.lineThrough,
      );
    }
    return const TextStyle(fontSize: 12);
  }
}
