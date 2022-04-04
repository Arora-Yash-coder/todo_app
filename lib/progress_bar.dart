import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  // Value shown in the progress bar
  final double value;
  const Progress({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: Colors.black,
            color: Colors.pinkAccent,
          ),
        ),
      ),
    );
  }
}
