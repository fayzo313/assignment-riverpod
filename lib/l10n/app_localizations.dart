import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'TaskFlow Planner'**
  String get appName;

  /// No description provided for @plannerTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Planner'**
  String get plannerTitle;

  /// No description provided for @plannerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Plan your priorities, stay focused, and finish today with clarity.'**
  String get plannerSubtitle;

  /// No description provided for @summaryTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get summaryTotal;

  /// No description provided for @summaryPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get summaryPending;

  /// No description provided for @summaryDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get summaryDone;

  /// No description provided for @splashTitle.
  ///
  /// In en, this message translates to:
  /// **'TaskFlow Planner'**
  String get splashTitle;

  /// No description provided for @splashSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Preparing your workspace...'**
  String get splashSubtitle;

  /// No description provided for @addTask.
  ///
  /// In en, this message translates to:
  /// **'Add Task'**
  String get addTask;

  /// No description provided for @saveTask.
  ///
  /// In en, this message translates to:
  /// **'Save Task'**
  String get saveTask;

  /// No description provided for @taskTitle.
  ///
  /// In en, this message translates to:
  /// **'Task title'**
  String get taskTitle;

  /// No description provided for @taskNote.
  ///
  /// In en, this message translates to:
  /// **'Task note'**
  String get taskNote;

  /// No description provided for @taskTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Finalize client proposal'**
  String get taskTitleHint;

  /// No description provided for @taskNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Add a short note or reminder.'**
  String get taskNoteHint;

  /// No description provided for @taskFormDescription.
  ///
  /// In en, this message translates to:
  /// **'Capture something important before it slips away.'**
  String get taskFormDescription;

  /// No description provided for @taskTitleRequired.
  ///
  /// In en, this message translates to:
  /// **'Title is required'**
  String get taskTitleRequired;

  /// No description provided for @taskTitleTooShort.
  ///
  /// In en, this message translates to:
  /// **'Use at least 3 characters'**
  String get taskTitleTooShort;

  /// No description provided for @priorityTitle.
  ///
  /// In en, this message translates to:
  /// **'Priority'**
  String get priorityTitle;

  /// No description provided for @priorityHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get priorityHigh;

  /// No description provided for @priorityMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get priorityMedium;

  /// No description provided for @priorityLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get priorityLow;

  /// No description provided for @quoteTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Focus'**
  String get quoteTitle;

  /// No description provided for @quoteLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading today\'s focus...'**
  String get quoteLoading;

  /// No description provided for @themeTitle.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get themeTitle;

  /// No description provided for @themeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the appearance that feels best for your workflow.'**
  String get themeSubtitle;

  /// No description provided for @languageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageTitle;

  /// No description provided for @languageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the language used across the app.'**
  String get languageSubtitle;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageArabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get languageArabic;

  /// No description provided for @clearTasks.
  ///
  /// In en, this message translates to:
  /// **'Clear all tasks'**
  String get clearTasks;

  /// No description provided for @clearTasksMessage.
  ///
  /// In en, this message translates to:
  /// **'This removes all saved tasks from your device until you add new ones again.'**
  String get clearTasksMessage;

  /// No description provided for @clearTasksSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Remove all saved tasks and start fresh.'**
  String get clearTasksSubtitle;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About TaskFlow'**
  String get aboutTitle;

  /// No description provided for @productivityOverview.
  ///
  /// In en, this message translates to:
  /// **'Productivity Overview'**
  String get productivityOverview;

  /// No description provided for @taskSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Tasks'**
  String get taskSectionTitle;

  /// No description provided for @taskSectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pull to refresh today\'s focus quote.'**
  String get taskSectionSubtitle;

  /// No description provided for @emptyTasks.
  ///
  /// In en, this message translates to:
  /// **'No tasks yet'**
  String get emptyTasks;

  /// No description provided for @emptyTasksSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add your first task to start organizing your day.'**
  String get emptyTasksSubtitle;

  /// No description provided for @taskSaved.
  ///
  /// In en, this message translates to:
  /// **'Task saved'**
  String get taskSaved;

  /// No description provided for @taskDeleted.
  ///
  /// In en, this message translates to:
  /// **'Task deleted'**
  String get taskDeleted;

  /// No description provided for @tasksCleared.
  ///
  /// In en, this message translates to:
  /// **'All tasks cleared'**
  String get tasksCleared;

  /// No description provided for @loadTasksError.
  ///
  /// In en, this message translates to:
  /// **'Unable to load tasks'**
  String get loadTasksError;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Unable to fetch the latest quote. Showing cached data if available.'**
  String get networkError;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @appInfo.
  ///
  /// In en, this message translates to:
  /// **'TaskFlow helps you track priorities, keep momentum, and stay intentional throughout the day.'**
  String get appInfo;

  /// No description provided for @quoteMeta.
  ///
  /// In en, this message translates to:
  /// **'{author} • {date}'**
  String quoteMeta(Object author, Object date);

  /// No description provided for @taskCreatedAt.
  ///
  /// In en, this message translates to:
  /// **'Created {date}'**
  String taskCreatedAt(Object date);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
