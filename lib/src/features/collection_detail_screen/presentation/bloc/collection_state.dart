import 'package:bloc_demo/main_export.dart';

sealed class UserState extends Equatable{
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitialState extends UserState{}
class UserLoading extends UserState{}
class ErrorInLoading extends UserState{}
class UserFetched extends UserState{
  final List<User> user;
  const UserFetched({required this.user});
  @override
  List<Object> get props => [user];
  @override
  bool get stringify => true;

}