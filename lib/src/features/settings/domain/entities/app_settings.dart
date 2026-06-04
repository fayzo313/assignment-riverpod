import 'package:flutter/material.dart';

enum AppLanguage {
  english('en'),
  arabic('ar');

  const AppLanguage(this.code);

  final String code;

  Locale get locale => Locale(code);

  static AppLanguage fromCode(String? code) {
    return switch (code) {
      'ar' => AppLanguage.arabic,
      _ => AppLanguage.english,
    };
  }
}

class AppSettings {
  const AppSettings({
    this.themeMode = ThemeMode.light,
    this.language = AppLanguage.english,
  });

  final ThemeMode themeMode;
  final AppLanguage language;

  bool get isDarkMode => themeMode == ThemeMode.dark;
  Locale get locale => language.locale;

  AppSettings copyWith({ThemeMode? themeMode, AppLanguage? language}) {
    return AppSettings(
      themeMode: themeMode ?? this.themeMode,
      language: language ?? this.language,
    );
  }

  factory AppSettings.fromStorage({
    String? rawThemeMode,
    String? rawLanguageCode,
    Locale? fallbackLocale,
  }) {
    final fallbackLanguage = AppLanguage.fromCode(fallbackLocale?.languageCode);

    return AppSettings(
      themeMode: rawThemeMode == ThemeMode.dark.name
          ? ThemeMode.dark
          : ThemeMode.light,
      language: rawLanguageCode == null
          ? fallbackLanguage
          : AppLanguage.fromCode(rawLanguageCode),
    );
  }
}
