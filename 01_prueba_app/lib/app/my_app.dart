import 'package:flutter/material.dart';
import 'package:prueba_appa/app/config/app_theme.dart';
import 'package:prueba_appa/app/presentation/screens/counter_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Contador App",
      home: const CounterScreen(),
      theme: AppTheme().getAppTheme(),
    );
  }
}
