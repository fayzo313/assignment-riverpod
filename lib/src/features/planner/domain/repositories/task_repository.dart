import '../entities/task.dart';

abstract interface class TaskRepository {
  Future<List<Task>> fetchTasks();
  Future<List<Task>> addTask(Task task);
  Future<List<Task>> updateTask(Task task);
  Future<List<Task>> deleteTask(String taskId);
  Future<List<Task>> clearTasks();
}
