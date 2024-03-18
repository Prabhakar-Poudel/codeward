import 'package:codeward/src/settings/appearance/theme_mode.dart';
import 'package:codeward/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';

class AppearanceSection extends StatelessWidget {
  final SettingsController controller;

  const AppearanceSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: ThemeModeDropdown(
          selectedThemeMode: controller.themeMode,
          onThemeModeChanged: controller.updateThemeMode,
        ));
  }
}