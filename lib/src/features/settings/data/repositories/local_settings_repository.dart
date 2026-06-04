import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/providers/shared_preferences_provider.dart';
import '../../../../core/storage/storage_keys.dart';
import '../../domain/entities/app_settings.dart';
import '../../domain/repositories/settings_repository.dart';

class LocalSettingsRepository implements SettingsRepository {
  const LocalSettingsRepository(this._ref);

  final Ref _ref;

  @override
  AppSettings load() {
    final sharedPreferences = _ref.read(sharedPreferencesProvider);
    final rawThemeMode = sharedPreferences.getString(StorageKeys.themeMode);
    final rawLanguageCode = sharedPreferences.getString(
      StorageKeys.languageCode,
    );

    return AppSettings.fromStorage(
      rawThemeMode: rawThemeMode,
      rawLanguageCode: rawLanguageCode,
      fallbackLocale: WidgetsBinding.instance.platformDispatcher.locale,
    );
  }

  @override
  Future<void> save(AppSettings settings) async {
    final sharedPreferences = _ref.read(sharedPreferencesProvider);

    await Future.wait([
      sharedPreferences.setString(
        StorageKeys.themeMode,
        settings.themeMode.name,
      ),
      sharedPreferences.setString(
        StorageKeys.languageCode,
        settings.language.code,
      ),
    ]);
  }
}
