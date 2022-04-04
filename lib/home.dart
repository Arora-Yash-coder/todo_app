import 'package:flutter/material.dart';
import 'dart:async';

import 'progress_bar.dart';
import 'task_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double progressValue = 0;
  bool checker = false;
  List<TaskItem> list = [];

  void progressChecker() {
    num temp = 0;
    if (list.isNotEmpty) {
      for (var i = 0; i < list.length; i++) {
        if (list[i].state == true) {
          temp++;
        }
      }
      setState(() {
        progressValue = temp / list.length;
        checker = true;
      });
    } else {
      setState(() {
        checker = false;
      });
    }
  }

  void addTask() {
    TextEditingController _textFieldController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'New Task',
              style: TextStyle(color: Colors.pinkAccent),
            ),
            content: TextField(
              style: const TextStyle(color: Colors.pinkAccent),
              controller: _textFieldController,
              decoration: const InputDecoration(
                  hintText: "New Task",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pinkAccent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.pinkAccent,
                  )),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'CANCEL',
                  style: TextStyle(color: Colors.pinkAccent),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.pinkAccent),
                ),
                onPressed: () {
                  list.add(TaskItem(
                    label: _textFieldController.text,
                    state: false,
                    index: list.length,
                    callback: callback,
                  ));
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(
        const Duration(milliseconds: 10), ((timer) => progressChecker()));
  }

  void callback(taskIndex) {
    setState(() {
      list.removeAt(taskIndex);
      for (var i = 0; i < list.length; i++) {
        list[i].index = i;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ToDo App",
          style: TextStyle(
            color: Colors.pinkAccent.shade100,
          ),
        ),
      ),
      body: Center(
        child: Column(children: [
          (checker)
              ? Progress(
                  value: progressValue,
                )
              : const Text(""),
          Expanded(
            flex: 9,
            child: Center(
              child: Column(
                children: list,
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
          addTask();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.yellow.shade200,
    );
  }
}
