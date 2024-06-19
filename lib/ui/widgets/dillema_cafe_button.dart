import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/design_system/font_styles.dart';
import 'package:flutter/material.dart';

class DillemaCafeButton extends StatefulWidget {
  const DillemaCafeButton({
    super.key,
    required this.isAvailable,
    required this.height,
    required this.titleText,
    required this.onTapFunction,
  });

  final bool isAvailable;
  final double height;
  final String titleText;
  final void Function() onTapFunction;

  @override
  State<DillemaCafeButton> createState() => _DillemaCafeButtonState();
}

class _DillemaCafeButtonState extends State<DillemaCafeButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTapFunction,
      child: Container(
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppValues.boxBorderRadius),
          color: widget.isAvailable ? AppColors.primary : AppColors.darkGray,
        ),
        child: Center(
          child: Text(
            widget.titleText,
            style: AppTextStyles.dillemaDisplay1.copyWith(
              color: widget.isAvailable ? AppColors.black : AppColors.gray,
            ),
          ),
        ),
      ),
    );
  }
}
