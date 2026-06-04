import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/context_x.dart';
import '../../../../core/extensions/date_time_x.dart';
import '../../../../core/widgets/app_error_state.dart';
import '../../application/daily_quote_controller.dart';

class DailyQuoteCard extends ConsumerWidget {
  const DailyQuoteCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quoteState = ref.watch(dailyQuoteControllerProvider);

    return quoteState.when(
      data: (quote) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        context.l10n.quoteTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        ref
                            .read(dailyQuoteControllerProvider.notifier)
                            .refresh();
                      },
                      icon: const Icon(Icons.refresh_rounded),
                    ),
                  ],
                ),
                Text(quote.text, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  context.l10n.quoteMeta(
                    quote.author,
                    quote.fetchedAt.toShortDateTime(context.localeCode),
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        );
      },
      loading: () => Card(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(strokeWidth: 2.5),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(context.l10n.quoteLoading),
            ],
          ),
        ),
      ),
      error: (_, _) => AppErrorState(
        message: context.l10n.networkError,
        onRetry: () {
          ref.read(dailyQuoteControllerProvider.notifier).refresh();
        },
      ),
    );
  }
}
