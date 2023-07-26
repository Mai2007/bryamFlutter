import 'package:flutter/material.dart';
import 'package:state_management/presentation/widgets/custom_button.dart';

class ChangeThemeStatefulScreen extends StatelessWidget {
  const ChangeThemeStatefulScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StatefulWidget"),
      ),
      body: Center(
        child: CustomButton(
          isDark: true,
          onPressed: () {},
        ),
      ),
    );
  }
}
