import '../entities/task.dart';

abstract class TodoRepository{

  Task addTask(Task task);

  List<Task> deleteTask(Task task, List<Task> taskList);

  List<Task> updateTask(Task task, List<Task> taskList);
}
