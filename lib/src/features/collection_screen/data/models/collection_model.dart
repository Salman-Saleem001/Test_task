import '../../../../../main_export.dart';


class UserModel extends UserEntity implements Equatable{
  UserModel({required super.users});


  factory UserModel.fromJson(List<dynamic> json) {
    return UserModel(
      users:  List<User>.from(json.map((x) => User.fromJson(x))),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [super.users];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}