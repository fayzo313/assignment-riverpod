import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/context_x.dart';
import '../../../planner/application/planner_controller.dart';
import '../../application/settings_controller.dart';
import '../../domain/entities/app_settings.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  Future<void> _clearTasks(BuildContext context, WidgetRef ref) async {
    final shouldClear = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(context.l10n.clearTasks),
          content: Text(context.l10n.clearTasksMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(context.l10n.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(context.l10n.clear),
            ),
          ],
        );
      },
    );

    if (shouldClear != true) {
      return;
    }

    await ref.read(plannerControllerProvider.notifier).clearTasks();

    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.tasksCleared)));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settingsTitle)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Card(
            child: SwitchListTile.adaptive(
              value: settings.isDarkMode,
              onChanged: (_) {
                ref.read(settingsControllerProvider.notifier).toggleTheme();
              },
              title: Text(context.l10n.themeTitle),
              subtitle: Text(context.l10n.themeSubtitle),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.languageTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    context.l10n.languageSubtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  SegmentedButton<AppLanguage>(
                    segments: [
                      ButtonSegment<AppLanguage>(
                        value: AppLanguage.english,
                        label: Text(context.l10n.languageEnglish),
                      ),
                      ButtonSegment<AppLanguage>(
                        value: AppLanguage.arabic,
                        label: Text(context.l10n.languageArabic),
                      ),
                    ],
                    selected: {settings.language},
                    showSelectedIcon: false,
                    onSelectionChanged: (selection) {
                      ref
                          .read(settingsControllerProvider.notifier)
                          .updateLanguage(selection.first);
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Card(
            child: ListTile(
              leading: const Icon(Icons.delete_outline),
              title: Text(context.l10n.clearTasks),
              subtitle: Text(context.l10n.clearTasksSubtitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _clearTasks(context, ref),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.aboutTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    context.l10n.appInfo,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
