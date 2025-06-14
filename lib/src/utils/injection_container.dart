import '../../main_export.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // sl.registerFactory(() => UserBloc());
  // Register datasource
  sl.registerSingleton<CollectionDataSource>(CollectionDataSource());
  // Register repository
  sl.registerSingleton<CollectionRepo>(UserRepositoryImplementation(sl<CollectionDataSource>()));
  // Register use cases
  sl.registerSingleton<CollectionUseCase>(CollectionUseCase(sl<CollectionRepo>()));
}
