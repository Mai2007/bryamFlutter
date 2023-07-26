import 'package:flutter_meedu/meedu.dart';

class ChangeThemeController extends SimpleNotifier {
  //Variables
  bool _isDark = true;

  //Metodos get
  bool get isDark => _isDark;

  //Metodos set
  set isDark(bool value) {
    _isDark = value;
    notify();
  }

  //Metodos adicionales
}
