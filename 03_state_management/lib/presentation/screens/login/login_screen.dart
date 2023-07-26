import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:state_management/presentation/screens/login/controllers/login_controller.dart';

final loginProvider = SimpleProvider((ref) => LoginController());

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Iniciar sesión"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  loginProvider.read.email = value;
                },
                decoration:
                    const InputDecoration(hintText: "Correo electrónico"),
              ),
              TextField(
                onChanged: (value) {
                  loginProvider.read.password = value;
                },
                decoration: const InputDecoration(hintText: "Contreña"),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Consumer(
                  builder: (context, ref, child) {
                    print("build consumer del boton");
                    final isValid = ref
                        .watch(loginProvider
                            .select((controller) => controller.isValid))
                        .isValid;
                    return FilledButton(
                      onPressed: isValid
                          ? () {
                              loginProvider.read.submit();
                            }
                          : null,
                      child: const Text("Login"),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
