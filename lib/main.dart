import 'package:app_translate/core/app_localizations.dart';
import 'package:app_translate/translate_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        AppLocalizations.engLocale,
        AppLocalizations.thLocale,
      ],
      path: AppLocalizations.translationFilePath,
      fallbackLocale: AppLocalizations.engLocale,
      startLocale: AppLocalizations.engLocale,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: TranslatePage(),
    );
  }
}
