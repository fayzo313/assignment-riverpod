import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/daily_quote.dart';

class RemoteQuoteDataSource {
  const RemoteQuoteDataSource(this._client);

  final http.Client _client;

  Future<DailyQuote> fetchDailyQuote() async {
    final response = await _client
        .get(Uri.parse(ApiConstants.randomQuoteUrl))
        .timeout(AppDurations.networkTimeout);

    if (response.statusCode != 200) {
      throw Exception('quote_request_failed');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    return DailyQuote(
      text: json['quote'] as String? ?? '',
      author: json['author'] as String? ?? AppConstants.appName,
      fetchedAt: DateTime.now(),
    );
  }
}
