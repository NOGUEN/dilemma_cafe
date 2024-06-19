import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/ui/design_system/font_styles.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.leadingIcon,
    required this.buttonTitle,
    required this.backgroundColor,
    required this.textColor,
    required this.height,
    required this.onTapFunction,
  });

  final Color backgroundColor;
  final Color textColor;
  final Widget leadingIcon;
  final String buttonTitle;
  final double height;
  final void Function() onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppValues.boxBorderRadius),
          color: backgroundColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
                child: leadingIcon,
              ),
              const SizedBox(width: 10),
              Text(
                buttonTitle,
                style: AppTextStyles.body3Medium.copyWith(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
