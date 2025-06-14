import 'package:bloc_demo/main_export.dart';
import '../../collection_detail_export.dart';

class CollectionDetailUseCase implements UseCase<CollectionDetailEntity, MessageParams> {
  final CollectionDetailRepo _collectionDetailRepo;
  CollectionDetailUseCase(this._collectionDetailRepo);
  @override
  Future<Either<Failure,CollectionDetailEntity>> call(MessageParams params) => _collectionDetailRepo.viewCollectionDetail(params.data);
}

class MessageParams extends Equatable {
  final Map<String, dynamic> data;
  const MessageParams({required this.data});

  @override
  List<Object> get props => [data];
}
