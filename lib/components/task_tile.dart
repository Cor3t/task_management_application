import 'package:flutter/material.dart';

class TaskTileWidget extends StatelessWidget {
  final bool value;
  final String title;

  const TaskTileWidget({
    required this.value,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: value,
      groupValue: true,
      title: Text(title),
      onChanged: (value) {},
    );
  }
}
