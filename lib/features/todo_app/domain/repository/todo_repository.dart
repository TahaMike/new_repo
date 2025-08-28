import '../entities/task.dart';

abstract class TodoRepository{

  void addTask(Task task);

  void deleteTask(Task task);

  void updateTask(Task task);
}