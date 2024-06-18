import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/design_system/font_styles.dart';
import 'package:dillema_cafe/ui/widgets/dillema_avatar_button.dart';
import 'package:flutter/material.dart';

class DillemaAvatarCard extends StatelessWidget {
  const DillemaAvatarCard({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.boxBorderRadius),
        color: AppColors.darkGray,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DillemaAvatar(
                  imgUrl: null,
                  size: 66,
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "김노근",
                      style: AppTextStyles.display1Bold
                          .copyWith(color: AppColors.white),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "가입일 2024.07.07",
                      style: AppTextStyles.body1Medium
                          .copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
