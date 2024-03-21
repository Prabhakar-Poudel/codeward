import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeModeDropdown extends StatelessWidget {
  final ThemeMode selectedThemeMode;
  final Function(ThemeMode?) onThemeModeChanged;

  ThemeModeDropdown({
    required this.selectedThemeMode,
    required this.onThemeModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<ThemeMode>(
      isExpanded: true,
      padding: const EdgeInsets.only(left: 16, right: 16),
      icon: const Icon(Icons.brightness_4_sharp),
      value: selectedThemeMode,
      onChanged: onThemeModeChanged,
      items: [
        DropdownMenuItem(
          value: ThemeMode.system,
          child: Text(AppLocalizations.of(context)!.system),
        ),
        DropdownMenuItem(
          value: ThemeMode.light,
          child: Text(AppLocalizations.of(context)!.light),
        ),
        DropdownMenuItem(
          value: ThemeMode.dark,
          child: Text(AppLocalizations.of(context)!.dark),
        )
      ],
    );
  }
}
