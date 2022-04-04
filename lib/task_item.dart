import 'package:flutter/material.dart';

class TaskItem extends StatefulWidget {
  // Task to do
  final String label;
  // State of the checkBox
  bool state;
  // Index of the TaskItem in the list
  int index;
  // Delete the Task Function
  final Function callback;
  TaskItem({
    Key? key,
    required this.label,
    required this.state,
    required this.index,
    required this.callback,
  }) : super(key: key);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(
          onChanged: (newValue) => setState(() {
            widget.state = newValue!;
          }),
          value: widget.state,
          activeColor: Colors.pinkAccent,
        ),
        Flexible(
          child: Text(widget.label),
        ),
        IconButton(
          color: Colors.pinkAccent,
          splashColor: Colors.pinkAccent.shade100,
          onPressed: () {
            widget.callback(widget.index);
          },
          icon: const Icon(
            Icons.delete,
          ),
        )
      ],
    );
  }
}
