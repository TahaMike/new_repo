import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _taskDescription = TextEditingController();
  final TextEditingController _taskTitle = TextEditingController();



  @override
  void dispose() {
    _taskTitle.dispose();
    _taskDescription.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextFormField(
            controller: _taskTitle,

          ),
        ],
      ),
    );
  }
}
