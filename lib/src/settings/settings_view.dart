import 'package:codeward/src/settings/appearance/appearance_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AppearanceView.routeName);
              },
              title: Text(AppLocalizations.of(context)!.appearance),
            ),
          ],
        ),
      ),
    );
  }
}
