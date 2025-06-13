import 'package:bloc_demo/main_export.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocListener<SignInBloc, SignInState>(
        listener: (BuildContext context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar().showSnackBar(text: state.error ?? ''));
          }
          if (state.isValid && !state.isSubmitting && state.error == null) {
            debugPrint("Login successful");
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                borderRadius: BorderRadius.circular(100),
                child: const Icon(Icons.arrow_back, color: AppColors.greyColor1, size: 24),
              ),
              40.hp(),
              CustomText(text: 'Sign In', fontSize: 32, fontFamily: Assets.ebGaramondMedium),
              40.hp(),
              SignInTextField(
                onChanged: (value) {
                  context.read<SignInBloc>().add(EmailChanged(value));
                },
              ),
              20.hp(),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (BuildContext context, state) {
                  return SignInTextField(
                    labelText: "Password",
                    isPassword: true,
                    isHidden: !state.showPassword,
                    onChanged: (val) {
                      context.read<SignInBloc>().add(PasswordChanged(val));
                    },
                    onSuffixPressed: () {
                      context.read<SignInBloc>().add(ShowPassword(!state.showPassword));
                    },
                  );
                },
              ),
              50.hp(),
              CustomButton(
                child: BlocBuilder<SignInBloc, SignInState>(
                  builder: (BuildContext context, state) {
                    if (state.isSubmitting) {
                      return SizedBox(
                        height: 20,
                        width: 20,
                        child: const CircularProgressIndicator(color: AppColors.backgroundColor, strokeWidth: 2.0),
                      );
                    }
                    return CustomText(
                      text: "Continue",
                      fontSize: 16,
                      textColor: AppColors.greyScaleColor,
                      fontFamily: Assets.ebGaramondMedium,
                    );
                  },
                ),
                onPressed: () {
                  context.read<SignInBloc>().add(SubmitSignIn());
                },
              ),
              50.hp(),
              TextWithTextButton(text: 'Can’t sign in?', buttonText: 'Recover password', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
