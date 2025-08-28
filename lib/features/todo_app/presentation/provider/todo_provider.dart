import 'package:flutter/cupertino.dart';

import '../../domain/entities/task.dart';
import '../../domain/usecase/todo_usecase.dart';

class TodoProvider extends ChangeNotifier{
  final TodoUseCase _todoUseCase;
  TodoProvider(this._todoUseCase); // why this happened??

  final List<Task> _taskList = [];
  List get taskList => _taskList;

  addTask(Task task) {
    _todoUseCase.addTask(task);
    _taskList.add(task);
    notifyListeners();
  }

  updateTask(Task task) {
    _todoUseCase.updateTask(task);
    notifyListeners(); // Do this update the list ??
  }

  deleteTask(Task task) {
    _todoUseCase.deleteTask(task); //
    _taskList.removeWhere((task) => task.taskId == task.taskId);
    notifyListeners();
  }

}