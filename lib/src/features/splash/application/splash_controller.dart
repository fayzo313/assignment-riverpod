import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/app_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/providers/shared_preferences_provider.dart';
import '../../../core/storage/storage_keys.dart';

final splashControllerProvider = FutureProvider<String>((ref) async {
  final sharedPreferences = ref.read(sharedPreferencesProvider);

  if (!(sharedPreferences.getBool(StorageKeys.hasOpenedApp) ?? false)) {
    await sharedPreferences.setBool(StorageKeys.hasOpenedApp, true);
  }

  await Future<void>.delayed(AppDurations.splash);
  return AppRoutes.planner;
});
