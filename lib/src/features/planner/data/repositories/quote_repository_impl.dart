import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/storage/storage_keys.dart';
import '../../domain/entities/daily_quote.dart';
import '../../domain/repositories/quote_repository.dart';
import '../datasources/remote_quote_data_source.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  const QuoteRepositoryImpl({
    required RemoteQuoteDataSource remoteDataSource,
    required SharedPreferences sharedPreferences,
  }) : _remoteDataSource = remoteDataSource,
       _sharedPreferences = sharedPreferences;

  final RemoteQuoteDataSource _remoteDataSource;
  final SharedPreferences _sharedPreferences;

  @override
  Future<DailyQuote> fetchDailyQuote({bool forceRefresh = false}) async {
    final cachedQuote = _readCachedQuote();
    final shouldUseCache =
        !forceRefresh &&
        cachedQuote != null &&
        _isSameDay(cachedQuote.fetchedAt, DateTime.now());

    if (shouldUseCache) {
      return cachedQuote;
    }

    try {
      final quote = await _remoteDataSource.fetchDailyQuote();
      await _sharedPreferences.setString(
        StorageKeys.cachedQuote,
        jsonEncode(quote.toJson()),
      );
      return quote;
    } catch (_) {
      if (cachedQuote != null) {
        return cachedQuote;
      }

      rethrow;
    }
  }

  DailyQuote? _readCachedQuote() {
    final rawQuote = _sharedPreferences.getString(StorageKeys.cachedQuote);

    if (rawQuote == null || rawQuote.isEmpty) {
      return null;
    }

    return DailyQuote.fromJson(jsonDecode(rawQuote) as Map<String, dynamic>);
  }

  bool _isSameDay(DateTime left, DateTime right) {
    return left.year == right.year &&
        left.month == right.month &&
        left.day == right.day;
  }
}
