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
        builder: (BuildContext context, TodoProvider value, Widget? child) {
          return ListView.builder(
          itemCount: value.taskList.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text('data'),
            );
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: AddTask(),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
