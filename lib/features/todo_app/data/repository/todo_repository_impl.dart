import '../../domain/entities/task.dart';
import '../../domain/repository/todo_repository.dart';
import '../model/task_model.dart';

class TodoRepositoryImpl extends TodoRepository {
  final List<TaskModel> _taskList = [];

  @override
  void addTask(Task task) {
    final model = TaskModel(
      taskId: task.taskId,
      taskTitle: task.taskTitle,
      taskDescription: task.taskDescription,
      taskStatus: task.taskStatus,
      taskPriority: task.taskPriority,
    );
    _taskList.add(model);
  }

  @override
  void deleteTask(String taskId) {}

  @override
  void updateTask(String taskId, String taskTitle, String taskDescription, int taskStatus) {}
}
