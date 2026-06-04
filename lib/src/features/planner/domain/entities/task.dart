enum TaskPriority {
  high(3),
  medium(2),
  low(1);

  const TaskPriority(this.weight);

  final int weight;

  static TaskPriority fromName(String? name) {
    return TaskPriority.values.firstWhere(
      (priority) => priority.name == name,
      orElse: () => TaskPriority.medium,
    );
  }
}

class Task {
  const Task({
    required this.id,
    required this.title,
    required this.note,
    required this.priority,
    required this.createdAt,
    this.isCompleted = false,
  });

  final String id;
  final String title;
  final String note;
  final TaskPriority priority;
  final bool isCompleted;
  final DateTime createdAt;

  Task copyWith({
    String? id,
    String? title,
    String? note,
    TaskPriority? priority,
    bool? isCompleted,
    DateTime? createdAt,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      priority: priority ?? this.priority,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'note': note,
      'priority': priority.name,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      note: json['note'] as String? ?? '',
      priority: TaskPriority.fromName(json['priority'] as String?),
      isCompleted: json['isCompleted'] as bool? ?? false,
      createdAt: DateTime.parse(
        json['createdAt'] as String? ?? DateTime.now().toIso8601String(),
      ),
    );
  }
}
