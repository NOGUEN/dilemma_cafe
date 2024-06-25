import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/design_system/font_styles.dart';
import 'package:flutter/material.dart';

class DilemmaListCell extends StatelessWidget {
  const DilemmaListCell({
    super.key,
    required this.titleText,
    required this.likeCount,
    required this.participateCount,
    required this.onTapFunction,
  });

  final String titleText;
  final int likeCount;
  final int participateCount;
  final void Function() onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppColors.darkGray,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  titleText,
                  style: AppTextStyles.dillemaSubhead1.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 12,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "$likeCount",
                        style: AppTextStyles.captionMedium.copyWith(
                          color: AppColors.lightGray,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        "$participateCount명 참여",
                        style: AppTextStyles.captionMedium.copyWith(
                          color: AppColors.lightGray,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}