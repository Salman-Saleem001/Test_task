import 'package:bloc_demo/main_export.dart';
import 'package:bloc_demo/src/features/collection_detail_screen/collection_detail_export.dart';

class CollectionDetailModel extends CollectionDetailEntity implements Equatable{
  CollectionDetailModel({required super.collection});

  factory CollectionDetailModel.fromJson(Map<String, dynamic> json) {
    return CollectionDetailModel(
      collection: CollectionDetail.fromJson(json),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [super.collection];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}