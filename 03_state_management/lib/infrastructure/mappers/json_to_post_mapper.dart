import 'package:state_management/domain/models/post_model.dart';

class JsonToPostMapper {
  Post jsonPlaceHolderPostToPostModel(Map<String, dynamic> json) {
    return Post(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      description: json["body"],
    );
  }
}
