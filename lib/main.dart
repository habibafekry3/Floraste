import 'package:first_flutter_project/pages/sign_up_page.dart';
import 'package:first_flutter_project/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'Translation',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> changeLang() async {
    final newLocale = context.locale.languageCode == 'en'
        ? const Locale('ar', 'EG')
        : const Locale('en', 'US');

    await context.setLocale(newLocale);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // localization
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      debugShowCheckedModeBanner: false,
      title: 'Floraste',
      theme: ThemeData(
        fontFamily: 'Suwannaphum',
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: SignupPage(changeLang: changeLang),
    );
  }
}
