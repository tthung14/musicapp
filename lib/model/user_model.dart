import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'photo')
  String? photo;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'hometown')
  String? hometown;
  @JsonKey(name: 'birthday')
  String? birthday;

  UserModel({this.id, this.username, this.email, this.phone, this.birthday, this.gender, this.hometown, this.photo});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() {
    return 'UserModel{id: $id, username: $username, email: $email, phone: $phone, birthday: $birthday, gender: $gender, hometown: $hometown, photo: $photo';
  }
}