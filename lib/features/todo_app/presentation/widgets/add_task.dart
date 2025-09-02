import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  int? _selectedPriority;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _taskDescription = TextEditingController();
  final TextEditingController _taskTitle = TextEditingController();

  final FocusNode _taskTitleNode = FocusNode();
  final FocusNode _taskDescriptionNode = FocusNode();

  final Map<int, String> taskPriority = {1: "High", 2: "Medium", 3: "Low"};
  final Map<int, String> taskStatus = {1: "completed", 2: "on going"};

  @override
  void dispose() {
    _taskTitle.dispose();
    _taskDescription.dispose();
    _taskDescriptionNode.dispose();
    _taskTitleNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _taskTitle,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              validator: (value) {
                if (value == null) {
                  return 'Please enter a value';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _taskDescription,
              decoration: InputDecoration(
                labelText: 'Title Description',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              validator: (value) {
                if (value == null) {
                  return 'Please enter a value';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            Container(
              height: 40,
              width: double.maxFinite,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Selected: ${_selectedPriority != null ? taskPriority[_selectedPriority] : "None"}",
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(70, 500, 60, 0),
                        items: [
                          PopupMenuItem(value: 1, child: Text("High")),
                          PopupMenuItem(value: 2, child: Text("Medium")),
                          PopupMenuItem(value: 3, child: Text("Low")),
                        ],
                      ).then((value) {
                        if (value != null) {
                          setState(() {
                            _selectedPriority = value;
                          });
                        }
                        else {
                          return "Please select priority";
                        }
                      });
                    },
                    icon: Icon(Icons.arrow_drop_down, size: 25),

                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(onPressed: () {

                }, child: Text('Add Task')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
