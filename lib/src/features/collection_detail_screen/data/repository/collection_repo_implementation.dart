import 'package:bloc_demo/main_export.dart';

class UserRepositoryImplementation extends UserRepo {
  final UserDataSource _dataSource;
  UserRepositoryImplementation(this._dataSource);
  @override
  Future<Either<Failure, UserEntity>> viewUsers(Map<String, dynamic> data) => _dataSource.getUsers();
}
