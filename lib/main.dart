import 'package:flutter/material.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'pages/main_navigation.dart';
import 'pages/synoptic.dart';

import 'utils/theme_data.dart';

void main() {
  runApp(
    EasyDynamicThemeWidget(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BnB',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: const MainNavigation(),
      routes: {
        // ChartsPage.routeName: (ctx) => const ChartsPage(),
        SynopticPage.routeName: (ctx) => const SynopticPage(),
        // AlarmsPage.routeName: (ctx) => const AlarmsPage(),
      },
      builder: EasyLoading.init(),
      // home: const ChartsPage(),
    );
  }
}
