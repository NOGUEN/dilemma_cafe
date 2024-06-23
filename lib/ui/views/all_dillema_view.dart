import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/core/models/json_models/dilemma_model.dart';
import 'package:dillema_cafe/core/viewmodels/all_dilemma_viewmodel.dart';
import 'package:dillema_cafe/ui/widgets/dilemma_filter_tapbar.dart';
import 'package:dillema_cafe/ui/widgets/dilemma_list_cell.dart';
import 'package:dillema_cafe/ui/widgets/dilemma_textfield.dart';
import 'package:flutter/material.dart';
import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/widgets/base_widget.dart';

class AllDilemmaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<AllDilemmaViewModel>(
      model: AllDilemmaViewModel(),
      onModelReady: (AllDilemmaViewModel model) => model.initModel(),
      builder: (BuildContext context, AllDilemmaViewModel model, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "모두 보기",
              style: TextStyle(
                fontFamily: "Jalnan",
                color: AppColors.primary,
              ),
            ),
            centerTitle: false,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppValues.horizontalPadding),
              child: Column(
                children: [
                  const DilemmaSearchTextField(),
                  const SizedBox(height: 15),
                  DilemmaFilterTapbar(
                    allDilemmaViewModel: model,
                  ),
                  const SizedBox(height: 15),
                  if (model.tapped[0] == true)
                    if (model.allDilemmas.isEmpty)
                      const CircularProgressIndicator(color: AppColors.primary),
                  if (model.tapped[0] == true)
                    if (model.allDilemmas.isNotEmpty)
                      for (DilemmaModel dilemma in model.allDilemmas)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: DilemmaListCell(
                            titleText: dilemma.title,
                            likeCount: dilemma.like,
                            participateCount: 0,
                            onTapFunction: () {
                              Navigator.of(context).pushNamed(
                                RoutePaths.Dilemma,
                                arguments: dilemma,
                              );
                            },
                          ),
                        ),
                  if (model.tapped[1] == true) const SizedBox(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
