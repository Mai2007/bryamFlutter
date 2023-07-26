import 'package:flutter_meedu/meedu.dart';
import 'package:state_management/domain/models/post_model.dart';
import 'package:state_management/infrastructure/datasources/posts_placeholder_datasource.dart';

class PostsController extends SimpleNotifier {
  bool isLoading = true;
  List<Post> posts = [];

  Future<void> loadPosts() async {
    // await Future.delayed(const Duration(seconds: 4));
    posts = await PostPlaceHolderDatasource().loadPost();
    //TODO: LLamar al API
    isLoading = false;
    notify();
  }
}
