import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:state_management/domain/models/comment_model.dart';
import 'package:state_management/domain/models/post_model.dart';
import 'package:state_management/domain/models/user_model.dart';
import 'package:state_management/infrastructure/mappers/json_to_commet_mapper.dart';
import 'package:state_management/infrastructure/mappers/json_to_post_mapper.dart';
import 'package:state_management/infrastructure/mappers/json_to_user_mapper.dart';

class PostPlaceHolderDatasource {
  Future<List<Post>> loadPost() async {
    var url = Uri.https('jsonplaceholder.typicode.com', 'posts');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    final List<Post> posts = parsed
        .map<Post>((e) => JsonToPostMapper().jsonPlaceHolderPostToPostModel(e))
        .toList();
    return posts;
  }

  Future<User> loadUserPost(int userId) async {
    print("userId in datasource $userId");
    var url = Uri.https('jsonplaceholder.typicode.com', 'users/$userId');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print("body ${response.body}");
    final json = jsonDecode(response.body);
    final User user = JsonToUserMapper().jsonPlaceHolderUserToUserModel(json);
    print(user);
    return user;
  }

  Future<List<CommentModel>> loadCommentsByPost(int postId) async {
    var url =
        Uri.https('jsonplaceholder.typicode.com', 'posts/$postId/comments');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    print(parsed);
    final List<CommentModel> posts = parsed
        .map<CommentModel>(
            (e) => JsonToCommentMapper().jsonPlaceHolderCommetToCommetModel(e))
        .toList();
    return posts;
  }
}
