import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:state_management/presentation/screens/change_theme/controllers/change_theme_controller.dart';

final changeThemeProvider =
    SimpleProvider<ChangeThemeController>((ref) => ChangeThemeController());

class ChangeThemeScreen extends StatelessWidget {
  const ChangeThemeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter meedu"),
      ),
      body: Center(
        child: FilledButton(
          onPressed: () {
            changeThemeProvider.read.isDark = !changeThemeProvider.read.isDark;
          },
          child: Consumer(
            builder: (_, ref, __) {
              final controller = ref.watch(changeThemeProvider);
              return Text("Cambiar a ${controller.isDark ? "ligth" : "dark"}");
            },
          ),
        ),
      ),
    );
  }
}
