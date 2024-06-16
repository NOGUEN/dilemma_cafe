import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/design_system/font_styles.dart';
import 'package:flutter/material.dart';

class DillemaTextfield extends StatelessWidget {
  const DillemaTextfield({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 50,
      maxLines: 3,
      controller: textEditingController,
      cursorColor: AppColors.primary,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      style: AppTextStyles.body2Regular.copyWith(color: AppColors.white),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
          borderRadius: BorderRadius.circular(AppValues.boxBorderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey, width: 1),
          borderRadius: BorderRadius.circular(AppValues.boxBorderRadius),
        ),
      ),
    );
  }
}
