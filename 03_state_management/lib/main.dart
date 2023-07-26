import 'package:flutter/material.dart';
import 'package:state_management/config/app_theme.dart';
import 'package:state_management/presentation/screens/change_theme/change_theme_screen.dart';
import 'package:state_management/presentation/screens/menu/menu_screen.dart';
import 'package:flutter_meedu/ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final controller = ref.watch(changeThemeProvider);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme().getTheme(isDark: controller.isDark),
          home: const MenuScreen(),
          navigatorObservers: [
            router
                .observer, // <-- this allows to flutter_meedu listen the changes in your navigator
          ],
        );
      },
    );
  }
}
