import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/app_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/context_x.dart';
import '../../application/daily_quote_controller.dart';
import '../../application/planner_controller.dart';
import '../widgets/daily_quote_card.dart';
import '../widgets/planner_header_card.dart';
import '../widgets/task_summary_cards.dart';
import '../widgets/task_tile.dart';

class PlannerPage extends ConsumerWidget {
  const PlannerPage({super.key});

  Future<void> _refresh(WidgetRef ref) {
    return Future.wait([
      ref.read(plannerControllerProvider.notifier).reload(),
      ref.read(dailyQuoteControllerProvider.notifier).refresh(),
    ]);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.addTask);
        },
        icon: const Icon(Icons.add_task_outlined),
        label: Text(context.l10n.addTask),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refresh(ref),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverAppBar.large(
              pinned: true,
              scrolledUnderElevation: 0,
              surfaceTintColor: Colors.transparent,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text(
                context.l10n.plannerTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.settings);
                  },
                  icon: const Icon(Icons.tune_outlined),
                ),
              ],
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                0,
                AppSpacing.lg,
                AppSpacing.xxl,
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate.fixed([
                  const PlannerHeaderCard(),
                  const SizedBox(height: AppSpacing.lg),
                  const DailyQuoteCard(),
                  const SizedBox(height: AppSpacing.lg),
                  const TaskSummaryCards(),
                  const SizedBox(height: AppSpacing.xl),
                  Text(
                    context.l10n.taskSectionTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    context.l10n.taskSectionSubtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.md),
                ]),
              ),
            ),
            const TaskListSliver(),
          ],
        ),
      ),
    );
  }
}

class TaskListSliver extends ConsumerWidget {
  const TaskListSliver({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plannerState = ref.watch(plannerControllerProvider);

    return plannerState.when(
      data: (state) {
        if (state.tasks.isEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                0,
                AppSpacing.lg,
                AppSpacing.xxl,
              ),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.inbox_outlined, size: 48),
                      const SizedBox(height: AppSpacing.md),
                      Text(
                        context.l10n.emptyTasks,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        context.l10n.emptyTasksSubtitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        return SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            0,
            AppSpacing.lg,
            120,
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final task = state.tasks[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: TaskTile(task: task),
              );
            }, childCount: state.tasks.length),
          ),
        );
      },
      loading: () => const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, _) => SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: Text(context.l10n.loadTasksError)),
      ),
    );
  }
}
