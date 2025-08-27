import '../entities/task.dart';

abstract class TodoRepository{

  void addTask(Task task);

  void deleteTask(String taskId);

  void updateTask(String taskId, String taskTitle, String taskDescription, int taskStatus);
}