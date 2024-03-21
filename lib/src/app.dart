import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'main_view/main_view.dart';
import 'settings/settings_view.dart';
import 'settings/appearance/appearance_view.dart';
import 'settings/appearance/appearance_controller.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key});

  final AppearanceController appearanceController = AppearanceController();

  @override
  Widget build(BuildContext context) {
    appearanceController.init();
    return ListenableBuilder(
      listenable: appearanceController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('de'),
            Locale('en'),
            Locale('it'),
            Locale('ru'),
          ],
          locale: appearanceController.locale,
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: appearanceController.themeMode,
          initialRoute: '/',
          routes: {
            MainView.routeName: (context) => MainView(),
            SettingsView.routeName: (context) => SettingsView(),
            AppearanceView.routeName: (context) =>
                AppearanceView(controller: appearanceController),
          },
        );
      },
    );
  }
}
