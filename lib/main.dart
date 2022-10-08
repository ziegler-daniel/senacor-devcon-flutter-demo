import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senacor_devcon_mysafe/settings/preferences/preferences.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Preferences(),
      child: Consumer<Preferences>(
          builder: (context, Preferences preferences, child) {
        return _materialApp(preferences);
      }),
    );
  }

  MaterialApp _materialApp(Preferences preferences) {
    return MaterialApp(
      title: 'My Safe',
      theme: preferences.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
