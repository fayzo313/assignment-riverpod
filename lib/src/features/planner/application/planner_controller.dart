import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/task.dart';
import 'planner_providers.dart';

final plannerControllerProvider =
    AsyncNotifierProvider<PlannerController, PlannerState>(
      PlannerController.new,
    );

class PlannerController extends AsyncNotifier<PlannerState> {
  @override
  Future<PlannerState> build() async {
    final tasks = await ref.read(taskRepositoryProvider).fetchTasks();
    return PlannerState(tasks: tasks);
  }

  Future<void> reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final tasks = await ref.read(taskRepositoryProvider).fetchTasks();
      return PlannerState(tasks: tasks);
    });
  }

  Future<void> addTask({
    required String title,
    required String note,
    required TaskPriority priority,
  }) async {
    final task = Task(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title.trim(),
      note: note.trim(),
      priority: priority,
      createdAt: DateTime.now(),
    );

    final tasks = await ref.read(taskRepositoryProvider).addTask(task);
    state = AsyncData(PlannerState(tasks: tasks));
  }

  Future<void> toggleTask(Task task) async {
    final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
    final tasks = await ref
        .read(taskRepositoryProvider)
        .updateTask(updatedTask);
    state = AsyncData(PlannerState(tasks: tasks));
  }

  Future<void> deleteTask(String taskId) async {
    final tasks = await ref.read(taskRepositoryProvider).deleteTask(taskId);
    state = AsyncData(PlannerState(tasks: tasks));
  }

  Future<void> clearTasks() async {
    final tasks = await ref.read(taskRepositoryProvider).clearTasks();
    state = AsyncData(PlannerState(tasks: tasks));
  }
}

class PlannerState {
  const PlannerState({required this.tasks});

  final List<Task> tasks;

  int get totalCount => tasks.length;

  int get completedCount => tasks.where((task) => task.isCompleted).length;

  int get pendingCount => totalCount - completedCount;
}
