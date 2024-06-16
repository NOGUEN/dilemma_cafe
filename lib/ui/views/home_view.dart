import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/ui/design_system/font_styles.dart';
import 'package:dillema_cafe/ui/widgets/dillema_list_cell.dart';
import 'package:flutter/material.dart';
import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/widgets/main_cell.dart';
import 'package:dillema_cafe/core/viewmodels/home_viewmodel.dart';
import 'package:dillema_cafe/ui/widgets/base_widget.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double mainCellHeight = (MediaQuery.of(context).size.width - 60) / 2;

    return BaseWidget<HomeViewModel>(
      model: HomeViewModel(),
      onModelReady: (HomeViewModel model) => model.initModel(),
      builder: (BuildContext context, HomeViewModel model, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "딜레마 카페",
              style: TextStyle(
                fontFamily: "Jalnan",
                color: AppColors.primary,
              ),
            ),
            centerTitle: false,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    size: 35,
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      MainCell(
                        titleText: "오늘의 딜레마",
                        descriptionText: "오늘의 추천 딜레마를 확인해봐요!",
                        bottomImg: SvgPicture.asset(
                          "assets/image/dillema_icon.svg",
                          width: 60,
                        ),
                        backgroundColor: AppColors.primary,
                        height: mainCellHeight,
                        onTapFunction: () {
                          Navigator.of(context).pushNamed(RoutePaths.Dillema);
                        },
                      ),
                      const SizedBox(width: 20),
                      MainCell(
                        titleText: "딜레마\n전체 보기",
                        descriptionText: "지금까지 올라온 모든 딜레마를 확인해봐요!",
                        bottomImg: SvgPicture.asset(
                          "assets/image/dillema_list_icon.svg",
                          width: 40,
                        ),
                        backgroundColor: AppColors.primary,
                        height: mainCellHeight,
                        onTapFunction: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "인기 딜레마!",
                      style: AppTextStyles.dillemaSubhead2.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  for (int i = 0; i < 5; i++)
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: DillemaListCell(
                        titleText: "송강 호떡 사주기 VS 송강호 떡 사주기",
                        likeCount: 100,
                        participateCount: 100,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
