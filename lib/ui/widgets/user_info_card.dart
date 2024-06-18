import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/design_system/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    super.key,
    required this.likeCount,
    required this.dillemaCount,
    required this.ticketCount,
  });

  final int likeCount;
  final int dillemaCount;
  final int ticketCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.boxBorderRadius),
        color: AppColors.darkGray,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                UserInfoCardCell(
                  titleText: "받은 좋아요",
                  count: likeCount,
                  icon: const Icon(
                    Icons.favorite,
                    color: AppColors.white,
                    size: 30,
                  ),
                ),
                const _Divider(),
                UserInfoCardCell(
                  titleText: "올린 딜레마",
                  count: dillemaCount,
                  icon: const Icon(
                    Icons.description,
                    color: AppColors.white,
                    size: 30,
                  ),
                ),
                const _Divider(),
                UserInfoCardCell(
                  titleText: "보유 티켓 수",
                  count: ticketCount,
                  icon: SvgPicture.asset(
                    'assets/image/ticket_icon.svg',
                    colorFilter: const ColorFilter.mode(
                        AppColors.white, BlendMode.srcIn),
                    height: 23,
                  ),
                ),
              ],
            ),
            ticketCount == 0
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(RoutePaths.Ticket);
                        },
                        child: Text("티켓이 없네요! 티켓을 구매하러 가보는건 어떨까요? >",
                            style: AppTextStyles.body1Medium
                                .copyWith(color: AppColors.lightGray)),
                      ),
                    ),
                  )
                : const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class UserInfoCardCell extends StatelessWidget {
  const UserInfoCardCell({
    super.key,
    required this.titleText,
    required this.count,
    required this.icon,
    this.onTapFunction,
  });

  final String titleText;
  final int count;
  final Widget icon;
  final void Function()? onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: SizedBox(
        width: 80,
        child: Column(
          children: [
            SizedBox(
              height: 30,
              child: icon,
            ),
            const SizedBox(height: 10),
            Text(
              titleText,
              style: AppTextStyles.subhead3SemiBold
                  .copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 5),
            Text(
              "$count개",
              style:
                  AppTextStyles.body2Regular.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80,
      child: VerticalDivider(
        color: AppColors.white,
        thickness: 0.5,
      ),
    );
  }
}
