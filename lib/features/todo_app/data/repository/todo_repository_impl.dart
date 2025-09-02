import '../../domain/entities/task.dart';
import '../../domain/repository/todo_repository.dart';
import '../model/task_model.dart';

class TodoRepositoryImpl extends TodoRepository {


  @override
  Task addTask(Task task) {
    final model = TaskModel(
      taskId: task.taskId,
      taskTitle: task.taskTitle,
      taskDescription: task.taskDescription,
      taskStatus: task.taskStatus,
      taskPriority: task.taskPriority,
    );
    return model;
  }

  @override
  List<Task> deleteTask(Task task, List<Task> taskList) {
    taskList.removeWhere((task) => task.taskId == task.taskId);
    return taskList;
  }

  @override
  List<Task> updateTask(Task task, List<Task> taskList) {
    final index = taskList.indexWhere((t) => t.taskId == task.taskId);
    if (index != -1) {
      taskList[index] = TaskModel(
        taskId: task.taskId,
        taskTitle: task.taskTitle,
        taskDescription: task.taskDescription,
        taskStatus: task.taskStatus,
        taskPriority: task.taskPriority,
      );
    }
    return taskList;
  }
}
