import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/daily_quote.dart';
import 'planner_providers.dart';

final dailyQuoteControllerProvider =
    AsyncNotifierProvider<DailyQuoteController, DailyQuote>(
      DailyQuoteController.new,
    );

class DailyQuoteController extends AsyncNotifier<DailyQuote> {
  @override
  Future<DailyQuote> build() {
    return ref.read(quoteRepositoryProvider).fetchDailyQuote();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () =>
          ref.read(quoteRepositoryProvider).fetchDailyQuote(forceRefresh: true),
    );
  }
}
