import 'package:bloc_demo/main_export.dart';

class CollectionModel extends CollectionEntity implements Equatable{
  CollectionModel({required super.collection});


  factory CollectionModel.fromJson(List<dynamic> json) {
    return CollectionModel(
      collection:  List<CollectionItem>.from(json.map((x) => CollectionItem.fromJson(x))),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [super.collection];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}