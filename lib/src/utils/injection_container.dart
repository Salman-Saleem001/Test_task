import '../../main_export.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => UserBloc());
  // Register datasource
  sl.registerSingleton<UserDataSource>(UserDataSource());
  // Register repository
  sl.registerSingleton<UserRepo>(UserRepositoryImplementation(sl<UserDataSource>()));
  // Register use cases
  sl.registerSingleton<UserUseCase>(UserUseCase(sl<UserRepo>()));
}
