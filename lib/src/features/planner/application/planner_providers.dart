import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/http_client_provider.dart';
import '../../../core/providers/shared_preferences_provider.dart';
import '../data/datasources/local_task_data_source.dart';
import '../data/datasources/remote_quote_data_source.dart';
import '../data/repositories/local_task_repository.dart';
import '../data/repositories/quote_repository_impl.dart';
import '../domain/repositories/quote_repository.dart';
import '../domain/repositories/task_repository.dart';

final localTaskDataSourceProvider = Provider<LocalTaskDataSource>((ref) {
  return LocalTaskDataSource(ref.read(sharedPreferencesProvider));
});

final remoteQuoteDataSourceProvider = Provider<RemoteQuoteDataSource>((ref) {
  return RemoteQuoteDataSource(ref.read(httpClientProvider));
});

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return LocalTaskRepository(
    dataSource: ref.read(localTaskDataSourceProvider),
    sharedPreferences: ref.read(sharedPreferencesProvider),
  );
});

final quoteRepositoryProvider = Provider<QuoteRepository>((ref) {
  return QuoteRepositoryImpl(
    remoteDataSource: ref.read(remoteQuoteDataSourceProvider),
    sharedPreferences: ref.read(sharedPreferencesProvider),
  );
});
