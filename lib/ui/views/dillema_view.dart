// ignore_for_file: must_be_immutable

import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/core/models/json_models/dilemma_model.dart';
import 'package:dillema_cafe/core/viewmodels/dillema_viewmodel.dart';
import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/widgets/dilemma_cafe_button.dart';
import 'package:dillema_cafe/ui/widgets/dilemma_pick_button.dart';
import 'package:dillema_cafe/ui/widgets/dilemma_textfield.dart';
import 'package:flutter/material.dart';
import 'package:dillema_cafe/ui/widgets/base_widget.dart';

class DillemaView extends StatefulWidget {
  DillemaView({
    super.key,
    required this.dillemaModel,
  });

  @override
  State<DillemaView> createState() => _DillemaViewState();

  final DilemmaModel dillemaModel;

  bool isTapped = false;
}

class _DillemaViewState extends State<DillemaView> {
  @override
  Widget build(BuildContext context) {
    double dillemaPickButtonHeight = MediaQuery.of(context).size.height * 2 / 7;

    return BaseWidget<DilemmaViewModel>(
      model: DilemmaViewModel(),
      onModelReady: (DilemmaViewModel model) => model.initModel(),
      builder: (BuildContext context, DilemmaViewModel model, _) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      DilemmaPickButton(
                        height: dillemaPickButtonHeight,
                        imgUrl: widget.dillemaModel.image1,
                        titleText: widget.dillemaModel.dilemma1,
                        isTapped: model.chosenDilemma[0],
                        onTapFunction: () {
                          setState(
                            () {
                              model.pickDilemma(0);
                            },
                          );
                        },
                      ),
                      DilemmaPickButton(
                        height: dillemaPickButtonHeight,
                        imgUrl: widget.dillemaModel.image2,
                        titleText: widget.dillemaModel.dilemma2,
                        isTapped: model.chosenDilemma[1],
                        onTapFunction: () {
                          setState(
                            () {
                              model.pickDilemma(1);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const Positioned.fill(
                    child: Center(
                      child: Text(
                        "VS",
                        style: TextStyle(
                          fontFamily: "Jalnan",
                          fontSize: 30,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppValues.horizontalPadding,
                ),
                child: DilemmaTextfield(
                  textEditingController: model.textEditingController,
                ),
              ),
              const Spacer(),
            ],
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppValues.horizontalPadding,
              ),
              child: DilemmaCafeButton(
                height: 50,
                titleText: "등록!",
                isAvailable: model.checkSubmitAvailable(),
                onTapFunction: () {},
              ),
            ),
          ),
        );
      },
    );
  }
}
