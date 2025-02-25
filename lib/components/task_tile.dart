import 'package:flutter/material.dart';

class TaskTileWidget extends StatelessWidget {
  final bool value;
  final String title;
  final Function(bool?) onChanged;

  const TaskTileWidget({
    required this.value,
    required this.title,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(value: value, onChanged: onChanged),
      title: Text(title),
    );
  }
}
