import 'package:codeward/src/settings/appearance/theme/theme_mode.dart';
import 'package:codeward/src/settings/appearance/language/app_language.dart';
import 'package:codeward/src/settings/appearance/appearance_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppearanceView extends StatelessWidget {
  final AppearanceController controller;

  AppearanceView({super.key, required this.controller});

  static const routeName = '/settings/appearance';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appearance),
      ),
      body: Column(
        children: [
          ThemeModeDropdown(
            selectedThemeMode: controller.themeMode,
            onThemeModeChanged: controller.updateThemeMode,
          ),
          LanguageDropdown(
            selectedLanguage: controller.locale,
            onLanguageChanged: controller.updateLocale,
          ),
        ],
      ),
    );
  }
}
