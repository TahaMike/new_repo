import 'package:deficient_calculator/features/todo_app/domain/entities/task.dart';
import 'package:deficient_calculator/features/todo_app/presentation/provider/todo_provider.dart';
import 'package:deficient_calculator/features/todo_app/presentation/widgets/add_task.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
          return Center(

          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
      ),
    );
  }
}
