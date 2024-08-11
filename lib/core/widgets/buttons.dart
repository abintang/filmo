import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ButtonWithText extends StatelessWidget {
  final double width;
  final double height;
  final double marginTop;
  final double fontSize;
  final Color textColor;
  final Color backgroundColorButton;
  final Color outlineColor;
  final String textButton;
  final VoidCallback onTapButton;

  /// [ButtonWithText] adalah widget yang digunakan untuk menampilkan button
  /// dengan hanya text yang berada pada center button.
  const ButtonWithText(
      {super.key,
      required this.width,
      required this.height,
      required this.fontSize,
      required this.textColor,
      required this.backgroundColorButton,
      required this.outlineColor,
      required this.textButton,
      required this.onTapButton,
      required this.marginTop});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      margin: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
        top: marginTop.h,
      ),
      decoration: BoxDecoration(
          color: backgroundColorButton,
          border: Border.all(color: outlineColor, width: 1),
          borderRadius: BorderRadius.circular(5)),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            onTapButton();
          },
          child: Center(
            child: Text(
              textButton,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor,
                  fontSize: fontSize.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonWithIcon extends StatelessWidget {
  final double width;
  final double height;
  final double fontSize;
  final double iconSize;
  final Color textIconColor;
  final Color backgroundColorButton;
  final Color outlineColor;
  final String textButton;
  final IconData iconButton;
  final VoidCallback onTapButton;

  /// [ButtonWithIcon] adalah widget yang digunakan untuk menampilkan button
  /// dengan leading icon.
  const ButtonWithIcon(
      {super.key,
      required this.textIconColor,
      required this.outlineColor,
      required this.backgroundColorButton,
      required this.textButton,
      required this.iconButton,
      required this.onTapButton,
      required this.width,
      required this.height,
      required this.fontSize,
      required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
          color: backgroundColorButton,
          border: Border.all(color: outlineColor, width: 1),
          borderRadius: BorderRadius.circular(5)),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            onTapButton();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                iconButton,
                size: iconSize.w,
                color: textIconColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                textButton,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textIconColor,
                    fontSize: fontSize.sp,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
