import 'package:flutter_meedu/meedu.dart';

class LoginController extends SimpleNotifier {
  //Variables
  // String email = "";
  // String password = "";
  String _email = "";
  String _password = "";
  bool isValid = false;

  //Get y sets

  String get email => _email;
  String get password => _password;

  set email(String value) {
    _email = value;
    notify();
    validateForm();
  }

  set password(String value) {
    _password = value;
    notify();
    validateForm();
  }

  //Metodos
  void submit() {
    print("email: $email");
    print("password: $password");
  }

  void validateForm() {
    if (_email.isNotEmpty && _email.length > 9) {
      if (_password.isNotEmpty && _password.length > 5) {
        isValid = true;
      } else {
        isValid = false;
      }
    } else {
      isValid = false;
    }
    notify();
  }
}
