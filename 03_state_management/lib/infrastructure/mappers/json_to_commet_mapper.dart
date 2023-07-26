import 'package:state_management/domain/models/comment_model.dart';

class JsonToCommentMapper {
  CommentModel jsonPlaceHolderCommetToCommetModel(Map<String, dynamic> json) {
    return CommentModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      description: json["body"],
    );
  }
}
