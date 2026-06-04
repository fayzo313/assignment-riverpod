// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'منظم تاسك فلو';

  @override
  String get plannerTitle => 'مخطط اليوم';

  @override
  String get plannerSubtitle =>
      'رتب أولوياتك، حافظ على تركيزك، وأنهِ يومك بوضوح.';

  @override
  String get summaryTotal => 'الإجمالي';

  @override
  String get summaryPending => 'قيد التنفيذ';

  @override
  String get summaryDone => 'مكتمل';

  @override
  String get splashTitle => 'منظم تاسك فلو';

  @override
  String get splashSubtitle => 'جارٍ تجهيز مساحتك...';

  @override
  String get addTask => 'إضافة مهمة';

  @override
  String get saveTask => 'حفظ المهمة';

  @override
  String get taskTitle => 'عنوان المهمة';

  @override
  String get taskNote => 'ملاحظة';

  @override
  String get taskTitleHint => 'إنهاء عرض العميل';

  @override
  String get taskNoteHint => 'أضف ملاحظة قصيرة أو تذكيرًا.';

  @override
  String get taskFormDescription => 'سجّل ما يهمك قبل أن يفوتك.';

  @override
  String get taskTitleRequired => 'عنوان المهمة مطلوب';

  @override
  String get taskTitleTooShort => 'استخدم 3 أحرف على الأقل';

  @override
  String get priorityTitle => 'الأولوية';

  @override
  String get priorityHigh => 'عالية';

  @override
  String get priorityMedium => 'متوسطة';

  @override
  String get priorityLow => 'منخفضة';

  @override
  String get quoteTitle => 'تركيز اليوم';

  @override
  String get quoteLoading => 'جارٍ تحميل تركيز اليوم...';

  @override
  String get themeTitle => 'الوضع الداكن';

  @override
  String get themeSubtitle => 'اختر المظهر الأنسب لطريقة عملك.';

  @override
  String get languageTitle => 'اللغة';

  @override
  String get languageSubtitle => 'اختر اللغة المستخدمة في التطبيق.';

  @override
  String get languageEnglish => 'الإنجليزية';

  @override
  String get languageArabic => 'العربية';

  @override
  String get clearTasks => 'مسح جميع المهام';

  @override
  String get clearTasksMessage =>
      'سيؤدي هذا إلى حذف جميع المهام المحفوظة على جهازك حتى تضيف مهامًا جديدة مرة أخرى.';

  @override
  String get clearTasksSubtitle => 'احذف جميع المهام المحفوظة وابدأ من جديد.';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get aboutTitle => 'حول تاسك فلو';

  @override
  String get productivityOverview => 'نظرة عامة على الإنجاز';

  @override
  String get taskSectionTitle => 'مهام اليوم';

  @override
  String get taskSectionSubtitle => 'اسحب للتحديث وجلب اقتباس التركيز اليومي.';

  @override
  String get emptyTasks => 'لا توجد مهام بعد';

  @override
  String get emptyTasksSubtitle => 'أضف أول مهمة لتبدأ بتنظيم يومك.';

  @override
  String get taskSaved => 'تم حفظ المهمة';

  @override
  String get taskDeleted => 'تم حذف المهمة';

  @override
  String get tasksCleared => 'تم مسح جميع المهام';

  @override
  String get loadTasksError => 'تعذر تحميل المهام';

  @override
  String get networkError =>
      'تعذر جلب الاقتباس الأخير. سيتم عرض البيانات المخزنة إن وجدت.';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get cancel => 'إلغاء';

  @override
  String get clear => 'مسح';

  @override
  String get appInfo =>
      'يساعدك تاسك فلو على متابعة أولوياتك، والحفاظ على الزخم، والعمل بتركيز طوال اليوم.';

  @override
  String quoteMeta(Object author, Object date) {
    return '$author • $date';
  }

  @override
  String taskCreatedAt(Object date) {
    return 'أُنشئت $date';
  }
}
