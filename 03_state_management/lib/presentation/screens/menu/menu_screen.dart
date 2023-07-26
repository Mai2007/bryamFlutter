import 'package:flutter/material.dart';
import 'package:state_management/presentation/screens/change_theme/change_theme_screen.dart';
import 'package:state_management/presentation/screens/change_theme_stateful/change_theme_stateful_screen.dart';
import 'package:state_management/presentation/screens/counter/counter_screen.dart';
import 'package:state_management/presentation/screens/login/login_screen.dart';
import 'package:state_management/presentation/screens/posts/posts_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("State management"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Cambiar el tema"),
            subtitle: const Text("Utilizando stateful Widget"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangeThemeStatefulScreen(),
                  ));
            },
          ),
          ListTile(
            title: const Text("Cambiar el tema"),
            subtitle: const Text("Utilizando flutter meedu"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangeThemeScreen(),
                  ));
            },
          ),
          ListTile(
            title: const Text("Counter"),
            subtitle: const Text("Utilizando flutter meedu"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CounterScreen(),
                  ));
            },
          ),
          ListTile(
            title: const Text("Login"),
            subtitle: const Text("Utilizando flutter meedu"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
            },
          ),
          ListTile(
            title: const Text("Post"),
            subtitle: const Text("Servicios por http"),
            onTap: () {
              postsProvider.read.loadPosts();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PostsScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
