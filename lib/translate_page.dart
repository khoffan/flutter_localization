import 'package:app_translate/core/app_localizations.dart';
import 'package:app_translate/my_translate.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'core/locale_keys.dart';

class TranslatePage extends StatefulWidget {
  TranslatePage({super.key});

  @override
  State<TranslatePage> createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  bool isThai = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("welcome-name".tr(args: ["Guys"])),
        actions: [
          IconButton(
            onPressed: () async {
              isThai = !isThai;
              await context.setLocale(
                isThai ? AppLocalizations.itLocale : AppLocalizations.engLocale,
              );

              setState(() {});
            },
            icon: Icon(Icons.language_outlined),
          ),
        ],
      ),
      body: const MyTranslate(),
    );
  }
}
