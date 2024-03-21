import 'package:flutter/material.dart';

class LanguageDropdown extends StatelessWidget {
  final Locale selectedLanguage;
  final Function(Locale?) onLanguageChanged;

  LanguageDropdown({
    required this.selectedLanguage,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Locale>(
      isExpanded: true,
      padding: const EdgeInsets.only(left: 16, right: 16),
      icon: const Icon(Icons.translate_sharp),
      value: selectedLanguage,
      onChanged: onLanguageChanged,
      items: [
        DropdownMenuItem(
          value: Locale('de'),
          child: Text('Deutsch'),
        ),
        DropdownMenuItem(
          value: Locale('en'),
          child: Text('English'),
        ),
        DropdownMenuItem(
          value: Locale('it'),
          child: Text('Italiano'),
        ),
        DropdownMenuItem(
          value: Locale('ru'),
          child: Text('Русский'),
        )
      ],
    );
  }
}
