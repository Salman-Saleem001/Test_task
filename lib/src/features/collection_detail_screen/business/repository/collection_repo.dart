import '../../../../../main_export.dart';

abstract class UserRepo{
  Future<Either<Failure, UserEntity>> viewUsers(Map<String, dynamic> data);
}