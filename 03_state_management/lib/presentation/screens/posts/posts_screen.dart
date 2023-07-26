import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:state_management/presentation/screens/post/post_screen.dart';
import 'package:state_management/presentation/screens/posts/controllers/posts_controller.dart';

final postsProvider =
    SimpleProvider<PostsController>((ref) => PostsController());

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final controller = ref.watch(postsProvider);
          return controller.isLoading
              ? const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Cargando..."),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: controller.posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final post = controller.posts[index];
                    return ListTile(
                      onTap: () {
                        postProvider.read.setPost(post);
                        postProvider.read.loadUser();
                        postProvider.read.loadCommets();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PostScreen()));
                      },
                      title: Text("${post.id} - ${post.title}"),
                      trailing: const Icon(Icons.chevron_right_outlined),
                    );
                  },
                );
        },
      ),
    );
  }
}
