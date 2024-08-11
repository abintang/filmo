import 'package:filmo/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UsernameTextField extends StatelessWidget {
  /// [UsernameTextFIeld] adalah widget yang menampilkan textfield untuk
  /// memasukkan username.
  final TextEditingController username;
  const UsernameTextField({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: username,
      decoration: InputDecoration(
        labelText: 'Username',
        labelStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.fontColorWithOpacity),
        hintText: 'Masukan username',
        hintStyle: TextStyle(
            color: AppColors.fontColor,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.cardOutlineColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
      ),
      style: TextStyle(
          color: AppColors.fontColor,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  /// [PasswordTextField] adalah widget yang menampilkan textfield untuk
  /// memasukkan password dengan opsi untuk toggle visibilitas password.

  final TextEditingController password;
  const PasswordTextField({super.key, required this.password});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.password,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.fontColorWithOpacity),
        floatingLabelStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.fontColorWithOpacity),
        hintText: 'Masukan password',
        hintStyle: TextStyle(
            color: AppColors.fontColor,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.cardOutlineColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      style: TextStyle(
          color: AppColors.fontColor,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp),
    );
  }
}
