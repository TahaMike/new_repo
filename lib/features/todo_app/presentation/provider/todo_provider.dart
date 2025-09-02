import 'package:flutter/cupertino.dart';

import '../../domain/entities/task.dart';
import '../../domain/usecase/todo_usecase.dart';

class TodoProvider extends ChangeNotifier{
  final TodoUseCase _todoUseCase;
  TodoProvider(this._todoUseCase);

  final List<Task> _taskList = [];
  List get taskList => _taskList;
  // List get taskList {
  //   final taskData =
  //   _taskList;
  //   taskData.sort((a, b)=> a.taskPriority > b.taskPriority );
  // }

  addTask(Task task) {
    final taskData = _todoUseCase.addTask(task);
    _taskList.add(taskData);
    notifyListeners();
  }

  updateTask(Task task) {
    final updatedList = _todoUseCase.updateTask(task, _taskList);
    _taskList.clear();
    _taskList.addAll(updatedList);
    notifyListeners(); // Do this update the list ??
  }

  deleteTask(Task task) {
    final deletedList = _todoUseCase.deleteTask(task, _taskList); //
    _taskList.clear();
    _taskList.addAll(deletedList);
    notifyListeners();
  }

}

