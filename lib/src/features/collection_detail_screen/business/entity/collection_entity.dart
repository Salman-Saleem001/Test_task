
class UserEntity{
  late final List<User> _users;
  List<User> get users => _users;
  UserEntity({required List<User> users}): _users=users;
}

class User {
  User({
      this.userId, 
      this.id, 
      this.title, 
      this.completed,});

  User copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return User(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  User.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }
  int? userId;
  int? id;
  String? title;
  bool? completed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['completed'] = completed;
    return map;
  }
}