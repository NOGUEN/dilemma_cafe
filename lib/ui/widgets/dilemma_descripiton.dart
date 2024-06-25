import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/design_system/font_styles.dart';
import 'package:flutter/material.dart';

class DilemmaDescripiton extends StatelessWidget {
  const DilemmaDescripiton({
    super.key,
    required this.dilemmaDescription,
  });

  final String dilemmaDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.darkGray,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppValues.horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "상황",
              style:
                  AppTextStyles.display1Bold.copyWith(color: AppColors.primary),
            ),
            const SizedBox(height: 5),
            Text(
              dilemmaDescription,
              style: AppTextStyles.body1Regular.copyWith(
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
