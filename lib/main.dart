import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practica_19/config/app_theme.dart';
import 'package:flutter_practica_19/src/listview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Práctica 19',
      home: ListViewPage()
    );
  }
}
