import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:flutter/material.dart';

class DillemaAvatarButton extends StatelessWidget {
  const DillemaAvatarButton({
    super.key,
    required this.onTapFunction,
    required this.imgUrl,
  });

  final void Function() onTapFunction;
  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: imgUrl == null
          ? Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.primary,
              ),
              child: const Icon(
                Icons.person,
                color: AppColors.white,
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                imgUrl!,
                fit: BoxFit.fill,
                width: 40,
                height: 40,
              ),
            ),
    );
  }
}

class DillemaAvatar extends StatelessWidget {
  const DillemaAvatar({
    super.key,
    required this.imgUrl,
    required this.size,
  });

  final String? imgUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return imgUrl == null
        ? Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.primary,
            ),
            child: const Icon(
              Icons.person,
              color: AppColors.white,
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              imgUrl!,
              fit: BoxFit.fill,
              width: size,
              height: size,
            ),
          );
  }
}
