import '../../../../../main_export.dart';

class UserDataSource{
  Future<Either<Failure, CollectionEntity>> getUsers() async {
    try {
      final response = await MyApiCalls.callGetReq();
      return response.fold(
            (failure) => Left(failure),
            (data) {
          try {
            if (data == null) throw Exception('Null response data');
            final userModel = CollectionModel.fromJson(data);
            return Right(userModel);
          } catch (e) {
            return Left(ParsingFailure('Data parsing failed: $e'));
          }
        },
      );
    } on DioException catch (e) {
      return Left(NetworkFailure('Network error: ${e.message}'));
    } catch (e) {
      return Left(ServerFailure('System error: $e'));
    }
  }
}