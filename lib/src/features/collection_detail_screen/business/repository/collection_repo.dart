import '../../../../../main_export.dart';

abstract class UserRepo{
  Future<Either<Failure, CollectionEntity>> viewUsers(Map<String, dynamic> data);
}