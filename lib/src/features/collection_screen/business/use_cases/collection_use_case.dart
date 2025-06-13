import '../../../../../main_export.dart';

class UserUseCase implements UseCase<UserEntity, MessageParams> {
  final UserRepo _userRepo;
  UserUseCase(this._userRepo);
  @override
  Future<Either<Failure, UserEntity>> call(MessageParams params) => _userRepo.viewUsers(params.data);
}

class MessageParams extends Equatable {
  final Map<String, dynamic> data;
  const MessageParams({required this.data});

  @override
  List<Object> get props => [data];
}
