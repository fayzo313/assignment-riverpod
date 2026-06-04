import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_managemtn_app/src/features/planner/data/datasources/local_task_data_source.dart';
import 'package:state_managemtn_app/src/features/planner/data/repositories/local_task_repository.dart';
import 'package:state_managemtn_app/src/features/planner/domain/entities/task.dart';

void main() {
  group('LocalTaskRepository', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    test('seeds demo tasks on first fetch', () async {
      final prefs = await SharedPreferences.getInstance();
      final repository = LocalTaskRepository(
        dataSource: LocalTaskDataSource(prefs),
        sharedPreferences: prefs,
      );

      final tasks = await repository.fetchTasks();

      expect(tasks, isNotEmpty);
      expect(tasks.first.title, isNotEmpty);
    });

    test('persists added task', () async {
      final prefs = await SharedPreferences.getInstance();
      final repository = LocalTaskRepository(
        dataSource: LocalTaskDataSource(prefs),
        sharedPreferences: prefs,
      );

      await repository.clearTasks();

      final tasks = await repository.addTask(
        Task(
          id: 'task-1',
          title: 'Persist me',
          note: 'Stored locally',
          priority: TaskPriority.high,
          createdAt: DateTime(2026),
        ),
      );

      expect(tasks, hasLength(1));

      final reloadedTasks = await repository.fetchTasks();
      expect(reloadedTasks.single.title, 'Persist me');
    });
  });
}
