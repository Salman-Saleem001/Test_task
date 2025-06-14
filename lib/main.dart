import 'package:bloc_demo/main_export.dart';
import 'package:bloc_demo/src/features/collection_detail_screen/collection_detail_export.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => CollectionBloc()), BlocProvider(create: (_) => SignInBloc()),BlocProvider(create: (_) => CollectionDetailBloc())],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparentColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
        ),
        child: MaterialApp(
          theme: ThemeData(
            progressIndicatorTheme: ProgressIndicatorThemeData(
              color: AppColors.buttonColor,
            ),
          ),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // BlocProvider(create: (_) => sl<UserBloc>(), child: SplashScreen()),
          home: SplashScreen(),
        ),
      ),
    );
  }
}
