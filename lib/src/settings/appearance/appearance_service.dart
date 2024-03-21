import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppearanceService {
  Future<ThemeMode> themeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeValue = prefs.getInt('themeMode') ?? 0;
    return ThemeMode.values[themeValue];
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', theme.index);
  }

  Future<Locale> appLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final appLocale = prefs.getString('locale') ?? 'en';
    return Locale(appLocale);
  }

  Future<void> setAppLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale.languageCode);
  }
}
