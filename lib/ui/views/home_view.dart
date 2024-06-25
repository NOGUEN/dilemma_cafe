// ignore_for_file: use_key_in_widget_constructors

import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/ui/design_system/font_styles.dart';
import 'package:dillema_cafe/ui/widgets/dilemma_avatar_button.dart';
import 'package:dillema_cafe/ui/widgets/dilemma_list_cell.dart';
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
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: DilemmaAvatarButton(
                  onTapFunction: () {
                    Navigator.of(context).pushNamed(RoutePaths.MyPage);
                  },
                  imgUrl: null,
                ),
              ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              model.initModel();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                parent: ClampingScrollPhysics(),
              ),
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
                            "assets/image/dilemma_icon.svg",
                            width: 60,
                          ),
                          backgroundColor: AppColors.primary,
                          height: mainCellHeight,
                          onTapFunction: () {
                            Navigator.of(context).pushNamed(RoutePaths.Dilemma);
                          },
                        ),
                        const SizedBox(width: 20),
                        MainCell(
                          titleText: "딜레마\n전체 보기",
                          descriptionText: "지금까지 올라온 모든 딜레마를 확인해봐요!",
                          bottomImg: SvgPicture.asset(
                            "assets/image/dilemma_list_icon.svg",
                            width: 40,
                          ),
                          backgroundColor: AppColors.primary,
                          height: mainCellHeight,
                          onTapFunction: () {
                            Navigator.of(context)
                                .pushNamed(RoutePaths.AllDilemma);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
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
                    if (model.popularDillemas.isEmpty)
                      const SizedBox(
                        height: 150,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    if (model.popularDillemas.isNotEmpty)
                      for (var dillema in model.popularDillemas)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: DilemmaListCell(
                            titleText: dillema.title,
                            likeCount: 0,
                            participateCount: 100,
                            onTapFunction: () {
                              Navigator.of(context).pushNamed(
                                  RoutePaths.Dilemma,
                                  arguments: dillema);
                            },
                          ),
                        ),
                    const SizedBox(height: 30.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "인기 릴레이 딜레마!",
                        style: AppTextStyles.dillemaSubhead2.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: AppColors.primary,
            onPressed: () {
              Navigator.of(context).pushNamed(RoutePaths.NewDilemma);
            },
            label: Text(
              "새로운 딜레마",
              style: AppTextStyles.subhead3Bold,
            ),
            icon: SvgPicture.asset(
              'assets/image/new_dilemma_icon.svg',
              width: 40,
              colorFilter:
                  const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
            ),
          ),
        );
      },
    );
  }
}
