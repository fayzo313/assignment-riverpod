import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';
import '../features/planner/presentation/pages/planner_page.dart';
import '../features/planner/presentation/pages/task_form_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';
import '../features/splash/presentation/pages/splash_page.dart';

abstract final class AppRoutes {
  static const splash = '/';
  static const planner = '/planner';
  static const addTask = '/add-task';
  static const settings = '/settings';
}

final class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final page = switch (settings.name) {
      AppRoutes.splash => const SplashPage(),
      AppRoutes.addTask => const TaskFormPage(),
      AppRoutes.settings => const SettingsPage(),
      _ => const PlannerPage(),
    };

    return PageRouteBuilder<void>(
      settings: settings,
      transitionDuration: AppDurations.pageTransition,
      reverseTransitionDuration: AppDurations.pageTransition,
      pageBuilder: (_, animation, _) => FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
        child: page,
      ),
    );
  }
}
