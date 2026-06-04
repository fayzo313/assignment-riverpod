import '../entities/daily_quote.dart';

abstract interface class QuoteRepository {
  Future<DailyQuote> fetchDailyQuote({bool forceRefresh = false});
}
