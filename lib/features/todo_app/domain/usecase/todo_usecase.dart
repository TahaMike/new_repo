import 'package:deficient_calculator/features/todo_app/domain/repository/todo_repository.dart';

import '../entities/task.dart';

class TodoUseCase {
  final TodoRepository _todoRepository;
  TodoUseCase(this._todoRepository);

  void addTask(Task task) => _todoRepository.addTask(task);

  void deleteTask(Task task) => _todoRepository.deleteTask(task);

  void updateTask(Task task) => _todoRepository.updateTask(task);
}