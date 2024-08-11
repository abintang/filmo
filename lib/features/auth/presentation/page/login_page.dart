import 'package:filmo/core/constants/app_colors.dart';
import 'package:filmo/core/widgets/buttons.dart';
import 'package:filmo/core/widgets/textfield.dart';
import 'package:filmo/features/auth/presentation/bloc/events/login_event.dart';
import 'package:filmo/features/auth/presentation/bloc/login_bloc.dart';
import 'package:filmo/features/auth/presentation/bloc/states/login_state.dart';
import 'package:filmo/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerUsername = TextEditingController();
    final TextEditingController controllerPassword = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 13.h, bottom: 0.5.h),
              child: Image.asset(
                'assets/images/logo.png',
                height: 25.w,
                width: 25.w,
              ),
            ),
          ),
          Center(
            child: Text(
              "Let's sign you in.",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.fontColor,
                  fontSize: 20.sp),
            ),
          ),
          Center(
            child: Container(
              width: 65.w,
              margin: EdgeInsets.only(top: 1.h),
              child: Text(
                "Sign in dengan username dan password yang telah kamu daftarkan di aplikasi",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.fontColorWithOpacity,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp),
              ),
            ),
          ),
          BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            if (state is InitialState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
                    child: UsernameTextField(username: controllerUsername),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: PasswordTextField(
                      password: controllerPassword,
                    ),
                  ),
                ],
              );
            } else if (state is LoginFailed) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
                    child: UsernameTextField(username: controllerUsername),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: PasswordTextField(
                      password: controllerPassword,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, top: 1.h),
                    child: Text(
                      "Username or Password Wrong",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              );
            } else if (state is LoginSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainLayout(id: state.user.id)));
              });
              return const SizedBox();
            } else {
              return const SizedBox();
            }
          }),
          ButtonWithText(
              width: 100,
              height: 5.5,
              fontSize: 16,
              textColor: AppColors.fontColor,
              backgroundColorButton: AppColors.primaryColor,
              outlineColor: AppColors.primaryColor,
              marginTop: 7,
              textButton: "Sign in",
              onTapButton: () {
                context.read<LoginBloc>().add(OnLoginApp(
                    username: controllerUsername.text,
                    password: controllerPassword.text));
              }),
          ButtonWithText(
              width: 100,
              height: 5.5,
              fontSize: 16,
              textColor: AppColors.primaryColor,
              backgroundColorButton: AppColors.backgroundColor,
              outlineColor: AppColors.primaryColor,
              textButton: "Continue as a Guest",
              marginTop: 1,
              onTapButton: () {}),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tidak memiliki akun? ",
                  style: TextStyle(
                      color: AppColors.fontColorWithOpacity,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
