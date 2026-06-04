import 'package:flutter/widgets.dart';

import '../../../l10n/app_localizations.dart';

extension ContextX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  String get localeCode => Localizations.localeOf(this).languageCode;
}
