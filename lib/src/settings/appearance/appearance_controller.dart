import 'package:flutter/material.dart';

import 'appearance_service.dart';

class AppearanceController with ChangeNotifier {
  final AppearanceService _appearanceService = AppearanceService();

  late ThemeMode _themeMode;
  late Locale _locale;

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;

  Future<void> init() async {
    _themeMode = await _appearanceService.themeMode();
    _locale = await _appearanceService.appLocale();

    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;

    notifyListeners();

    await _appearanceService.updateThemeMode(newThemeMode);
  }

  Future<void> updateLocale(Locale? newLocale) async {
    if (newLocale == null) return;

    if (newLocale == _locale) return;

    _locale = newLocale;

    notifyListeners();

    await _appearanceService.setAppLocale(newLocale);
  }
}
