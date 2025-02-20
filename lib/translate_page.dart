import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TranslatePage extends StatefulWidget {
  Function? changeLang;
  TranslatePage({super.key, this.changeLang});

  @override
  State<TranslatePage> createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  bool isThai = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translate'),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                isThai = !isThai;
              });
              widget.changeLang!(
                isThai ? const Locale('th') : const Locale('en'),
              );
            },
            child: Text("change lang"),
          ),
        ],
      ),
      body: const MyTranslate(),
    );
  }
}

class MyTranslate extends StatefulWidget {
  const MyTranslate({super.key});

  @override
  State<MyTranslate> createState() => _MyTranslateState();
}

class _MyTranslateState extends State<MyTranslate> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(AppLocalizations.of(context)!.hello("john")),
          Text(AppLocalizations.of(context)!.hello("matha")),
        ],
      ),
    );
  }
}
