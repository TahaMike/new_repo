import 'package:deficient_calculator/features/todo_app/domain/repository/todo_repository.dart';

import '../entities/task.dart';

class TodoUseCase {
  final TodoRepository _todoRepository;
  TodoUseCase(this._todoRepository);

  Task addTask(Task task) => _todoRepository.addTask(task);

  List<Task> deleteTask(Task task, List<Task> taskList) => _todoRepository.deleteTask(task, taskList);

  List<Task> updateTask(Task task, List<Task> taskList) => _todoRepository.updateTask(task, taskList);
}