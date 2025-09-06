import 'dart:ui';

import 'package:deficient_calculator/features/todo_app/presentation/provider/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../widgets/add_task.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        centerTitle: true,
        leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back)),
      ),
      body: Consumer<TodoProvider>(
        builder: (BuildContext mainContext, TodoProvider value, Widget? child) {
          return ListView.builder(
            itemCount: value.taskList.length,
            itemBuilder: (_, index) {
              final task = value.taskList[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          task.taskStatus == 1 ? Icons.check_box : Icons.check_box_outline_blank,
                          color: task.taskStatus == 1 ? Colors.green : Colors.grey,
                        ),
                      ),
                      Text("${task.taskTitle}: ${task.taskDescription}", style: TextStyle(fontSize: 20)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever)),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
              child: Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: AddTask(mainContext: context),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
