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
//
// class TaskModel2 implements Task{
//   @override
//
//   // TODO: implement taskDescription
//   String get taskDescription => throw UnimplementedError();
//
//   @override
//   // TODO: implement taskId
//   String get taskId => throw UnimplementedError();
//
//   @override
//   // TODO: implement taskPriority
//   int get taskPriority => throw UnimplementedError();
//
//   @override
//   // TODO: implement taskStatus
//   int get taskStatus => throw UnimplementedError();
//
//   @override
//   // TODO: implement taskTitle
//   String get taskTitle => throw UnimplementedError();
//
// }