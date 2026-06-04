import 'package:flutter/widgets.dart';

import '../../../core/extensions/context_x.dart';
import '../domain/entities/task.dart';

extension TaskPriorityX on TaskPriority {
  String localizedLabel(BuildContext context) {
    return switch (this) {
      TaskPriority.high => context.l10n.priorityHigh,
      TaskPriority.medium => context.l10n.priorityMedium,
      TaskPriority.low => context.l10n.priorityLow,
    };
  }
}
