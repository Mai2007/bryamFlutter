import 'package:flutter_meedu/meedu.dart';
import 'package:state_management/domain/models/comment_model.dart';
import 'package:state_management/domain/models/post_model.dart';
import 'package:state_management/domain/models/user_model.dart';
import 'package:state_management/infrastructure/datasources/posts_placeholder_datasource.dart';

class PostController extends SimpleNotifier {
  late Post post;
  User? user;
  List<CommentModel> comments = [];

  void setPost(Post post) {
    this.post = post;
  }

  void loadCommets() async {
    comments = await PostPlaceHolderDatasource().loadCommentsByPost(post.id);
    notify();
  }

  void loadUser() async {
    user = await PostPlaceHolderDatasource().loadUserPost(post.userId);
    notify();
  }
}
