import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/task.dart';
import '../../../../core/storage/storage_keys.dart';

class LocalTaskDataSource {
  const LocalTaskDataSource(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  List<Task> fetchTasks() {
    final rawTasks = _sharedPreferences.getStringList(StorageKeys.tasks);

    if (rawTasks == null || rawTasks.isEmpty) {
      return const [];
    }

    return rawTasks
        .map(
          (rawTask) =>
              Task.fromJson(jsonDecode(rawTask) as Map<String, dynamic>),
        )
        .toList(growable: false);
  }

  Future<void> saveTasks(List<Task> tasks) {
    final rawTasks = tasks
        .map((task) => jsonEncode(task.toJson()))
        .toList(growable: false);

    return _sharedPreferences.setStringList(StorageKeys.tasks, rawTasks);
  }
}
