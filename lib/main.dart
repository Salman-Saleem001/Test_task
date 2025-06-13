import 'package:bloc_demo/main_export.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => UserBloc()), BlocProvider(create: (_) => SignInBloc())],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparentColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // BlocProvider(create: (_) => sl<UserBloc>(), child: SplashScreen()),
          home: SplashScreen(),
        ),
      ),
    );
  }
}
