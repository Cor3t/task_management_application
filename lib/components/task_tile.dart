import 'package:flutter/material.dart';

class TaskTileWidget extends StatelessWidget {
  final bool value;
  final String title;
  final Function(bool?) onChanged;
  final Function()? onTap;

  const TaskTileWidget({
    required this.value,
    required this.title,
    required this.onChanged,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(value: value, onChanged: onChanged),
      title: Text(title),
      onTap: onTap,
    );
  }
}
