// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'TaskFlow Planner';

  @override
  String get plannerTitle => 'Daily Planner';

  @override
  String get plannerSubtitle =>
      'Plan your priorities, stay focused, and finish today with clarity.';

  @override
  String get summaryTotal => 'Total';

  @override
  String get summaryPending => 'Pending';

  @override
  String get summaryDone => 'Done';

  @override
  String get splashTitle => 'TaskFlow Planner';

  @override
  String get splashSubtitle => 'Preparing your workspace...';

  @override
  String get addTask => 'Add Task';

  @override
  String get saveTask => 'Save Task';

  @override
  String get taskTitle => 'Task title';

  @override
  String get taskNote => 'Task note';

  @override
  String get taskTitleHint => 'Finalize client proposal';

  @override
  String get taskNoteHint => 'Add a short note or reminder.';

  @override
  String get taskFormDescription =>
      'Capture something important before it slips away.';

  @override
  String get taskTitleRequired => 'Title is required';

  @override
  String get taskTitleTooShort => 'Use at least 3 characters';

  @override
  String get priorityTitle => 'Priority';

  @override
  String get priorityHigh => 'High';

  @override
  String get priorityMedium => 'Medium';

  @override
  String get priorityLow => 'Low';

  @override
  String get quoteTitle => 'Daily Focus';

  @override
  String get quoteLoading => 'Loading today\'s focus...';

  @override
  String get themeTitle => 'Dark mode';

  @override
  String get themeSubtitle =>
      'Choose the appearance that feels best for your workflow.';

  @override
  String get languageTitle => 'Language';

  @override
  String get languageSubtitle => 'Choose the language used across the app.';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageArabic => 'Arabic';

  @override
  String get clearTasks => 'Clear all tasks';

  @override
  String get clearTasksMessage =>
      'This removes all saved tasks from your device until you add new ones again.';

  @override
  String get clearTasksSubtitle => 'Remove all saved tasks and start fresh.';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get aboutTitle => 'About TaskFlow';

  @override
  String get productivityOverview => 'Productivity Overview';

  @override
  String get taskSectionTitle => 'Today\'s Tasks';

  @override
  String get taskSectionSubtitle => 'Pull to refresh today\'s focus quote.';

  @override
  String get emptyTasks => 'No tasks yet';

  @override
  String get emptyTasksSubtitle =>
      'Add your first task to start organizing your day.';

  @override
  String get taskSaved => 'Task saved';

  @override
  String get taskDeleted => 'Task deleted';

  @override
  String get tasksCleared => 'All tasks cleared';

  @override
  String get loadTasksError => 'Unable to load tasks';

  @override
  String get networkError =>
      'Unable to fetch the latest quote. Showing cached data if available.';

  @override
  String get retry => 'Retry';

  @override
  String get cancel => 'Cancel';

  @override
  String get clear => 'Clear';

  @override
  String get appInfo =>
      'TaskFlow helps you track priorities, keep momentum, and stay intentional throughout the day.';

  @override
  String quoteMeta(Object author, Object date) {
    return '$author • $date';
  }

  @override
  String taskCreatedAt(Object date) {
    return 'Created $date';
  }
}
