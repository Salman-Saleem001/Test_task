import '../../../../../main_export.dart';

class UserUseCase implements UseCase<CollectionEntity, MessageParams> {
  final CollectionRepo _userRepo;
  UserUseCase(this._userRepo);
  @override
  Future<Either<Failure, CollectionEntity>> call(MessageParams params) => _userRepo.viewCollection(params.data);
}

class MessageParams extends Equatable {
  final Map<String, dynamic> data;
  const MessageParams({required this.data});

  @override
  List<Object> get props => [data];
}
