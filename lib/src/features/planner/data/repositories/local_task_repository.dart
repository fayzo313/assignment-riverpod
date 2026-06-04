import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/storage/storage_keys.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/local_task_data_source.dart';

class LocalTaskRepository implements TaskRepository {
  LocalTaskRepository({
    required LocalTaskDataSource dataSource,
    required SharedPreferences sharedPreferences,
  }) : _dataSource = dataSource,
       _sharedPreferences = sharedPreferences;

  final LocalTaskDataSource _dataSource;
  final SharedPreferences _sharedPreferences;

  @override
  Future<List<Task>> fetchTasks() async {
    final storedTasks = _sortTasks(_dataSource.fetchTasks());

    if (storedTasks.isNotEmpty) {
      return storedTasks;
    }

    final hasSeededTasks =
        _sharedPreferences.getBool(StorageKeys.hasSeededTasks) ?? false;

    if (hasSeededTasks) {
      return const [];
    }

    final demoTasks = _sortTasks(_buildDemoTasks());
    await _dataSource.saveTasks(demoTasks);
    await _sharedPreferences.setBool(StorageKeys.hasSeededTasks, true);
    return demoTasks;
  }

  @override
  Future<List<Task>> addTask(Task task) async {
    final tasks = await fetchTasks();
    final nextTasks = _sortTasks([...tasks, task]);
    await _dataSource.saveTasks(nextTasks);
    return nextTasks;
  }

  @override
  Future<List<Task>> updateTask(Task task) async {
    final tasks = await fetchTasks();
    final nextTasks = _sortTasks(
      tasks
          .map((currentTask) => currentTask.id == task.id ? task : currentTask)
          .toList(growable: false),
    );
    await _dataSource.saveTasks(nextTasks);
    return nextTasks;
  }

  @override
  Future<List<Task>> deleteTask(String taskId) async {
    final tasks = await fetchTasks();
    final nextTasks = tasks
        .where((task) => task.id != taskId)
        .toList(growable: false);
    await _dataSource.saveTasks(nextTasks);
    return nextTasks;
  }

  @override
  Future<List<Task>> clearTasks() async {
    await _dataSource.saveTasks(const []);
    await _sharedPreferences.setBool(StorageKeys.hasSeededTasks, true);
    return const [];
  }

  List<Task> _sortTasks(List<Task> tasks) {
    final nextTasks = List<Task>.from(tasks);

    nextTasks.sort((left, right) {
      final completionComparison = left.isCompleted == right.isCompleted
          ? 0
          : (left.isCompleted ? 1 : -1);

      if (completionComparison != 0) {
        return completionComparison;
      }

      final priorityComparison = right.priority.weight.compareTo(
        left.priority.weight,
      );

      if (priorityComparison != 0) {
        return priorityComparison;
      }

      return right.createdAt.compareTo(left.createdAt);
    });

    return List.unmodifiable(nextTasks);
  }

  List<Task> _buildDemoTasks() {
    final now = DateTime.now();
    final languageCode =
        _sharedPreferences.getString(StorageKeys.languageCode) ?? 'en';

    if (languageCode == 'ar') {
      return [
        Task(
          id: 'demo-1',
          title: 'مراجعة أهداف الأسبوع',
          note: 'حدد النتائج الأهم التي تريد إنجازها اليوم.',
          priority: TaskPriority.high,
          isCompleted: true,
          createdAt: now.subtract(const Duration(hours: 5)),
        ),
        Task(
          id: 'demo-2',
          title: 'إرسال رسائل المتابعة',
          note: 'رد على المحادثات المعلقة قبل الظهر.',
          priority: TaskPriority.high,
          createdAt: now.subtract(const Duration(hours: 2)),
        ),
        Task(
          id: 'demo-3',
          title: 'حجز جلسة عمل عميق',
          note: 'خصص 90 دقيقة للتركيز دون مقاطعات.',
          priority: TaskPriority.medium,
          createdAt: now.subtract(const Duration(minutes: 30)),
        ),
      ];
    }

    return [
      Task(
        id: 'demo-1',
        title: 'Review weekly goals',
        note: 'Confirm the top outcomes that matter most today.',
        priority: TaskPriority.high,
        isCompleted: true,
        createdAt: now.subtract(const Duration(hours: 5)),
      ),
      Task(
        id: 'demo-2',
        title: 'Send follow-up emails',
        note: 'Reply to pending conversations before noon.',
        priority: TaskPriority.high,
        createdAt: now.subtract(const Duration(hours: 2)),
      ),
      Task(
        id: 'demo-3',
        title: 'Block deep work session',
        note: 'Reserve 90 minutes for uninterrupted focus.',
        priority: TaskPriority.medium,
        createdAt: now.subtract(const Duration(minutes: 30)),
      ),
    ];
  }
}
