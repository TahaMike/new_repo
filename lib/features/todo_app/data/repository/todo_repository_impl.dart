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
  void deleteTask(Task task) {
    _taskList.removeWhere((task) => task.taskId == task.taskId);
  }

  @override
  void updateTask(Task task) {
    final index = _taskList.indexWhere((t) => t.taskId == task.taskId);
    if (index != -1) {
      _taskList[index] = TaskModel(
        taskId: task.taskId,
        taskTitle: task.taskTitle,
        taskDescription: task.taskDescription,
        taskStatus: task.taskStatus,
        taskPriority: task.taskPriority,
      );
    }
  }
}
