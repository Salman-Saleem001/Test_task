import 'package:bloc_demo/main_export.dart';

abstract class UserRepo{
  Future<Either<Failure, UserEntity>> viewUsers(Map<String, dynamic> data);
}