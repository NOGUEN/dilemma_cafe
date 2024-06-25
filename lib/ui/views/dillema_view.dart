// ignore_for_file: must_be_immutable

import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/core/models/json_models/dilemma_model.dart';
import 'package:dillema_cafe/core/viewmodels/dillema_viewmodel.dart';
import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/widgets/dilemma_cafe_button.dart';
import 'package:dillema_cafe/ui/widgets/dilemma_descripiton.dart';
import 'package:dillema_cafe/ui/widgets/dilemma_pick_button.dart';
import 'package:dillema_cafe/ui/widgets/dilemma_textfield.dart';
import 'package:flutter/material.dart';
import 'package:dillema_cafe/ui/widgets/base_widget.dart';
import 'package:flutter_svg/svg.dart';

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
          appBar: AppBar(
            title: Text(
              widget.dillemaModel.title,
              style: const TextStyle(
                fontFamily: "Jalnan",
                color: AppColors.primary,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                if (widget.dillemaModel.description != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppValues.horizontalPadding,
                      vertical: 10.0,
                    ),
                    child: DilemmaDescripiton(
                      dilemmaDescription: widget.dillemaModel.description!,
                    ),
                  ),
                if (widget.dillemaModel.description == null)
                  const SizedBox(height: 10.0),
                Stack(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppValues.horizontalPadding),
                          child: DilemmaPickButton(
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
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppValues.horizontalPadding),
                          child: DilemmaPickButton(
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
                        ),
                      ],
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: SvgPicture.asset(
                              "assets/image/vs_icon.svg",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppValues.horizontalPadding,
                  ),
                  child: DilemmaTextfield(
                    textEditingController: model.textEditingController,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppValues.horizontalPadding,
              ),
              child: DilemmaCafeButton(
                height: 50,
                titleText: "투표하고 결과 보기!",
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
