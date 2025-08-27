import 'package:deficient_calculator/features/todo_app/domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    required super.taskId,
    required super.taskTitle,
    required super.taskDescription,
    required super.taskStatus,
    required super.taskPriority,
  });
}
