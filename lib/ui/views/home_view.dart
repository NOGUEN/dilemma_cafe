import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dillema_cafe/core/viewmodels/home_viewmodel.dart';
import 'package:dillema_cafe/ui/views/base_widget.dart';

class HomeView extends StatelessWidget {
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
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
          body: Column(
            children: [],
          ),
        );
      },
    );
  }
}
