import 'package:state_management/domain/models/user_model.dart';

class JsonToUserMapper {
  User jsonPlaceHolderUserToUserModel(Map<String, dynamic> json) {
    print(json);
    return User(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json["email"],
    );
  }
}
