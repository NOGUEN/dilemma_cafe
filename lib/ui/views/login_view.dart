import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/core/viewmodels/login_viewmodel.dart';
import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/design_system/font_styles.dart';
import 'package:dillema_cafe/ui/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:dillema_cafe/ui/widgets/base_widget.dart';
import 'package:flutter_svg/svg.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return BaseWidget<LoginViewmodel>(
      model: LoginViewmodel(),
      onModelReady: (LoginViewmodel model) => model.initModel(),
      builder: (BuildContext context, LoginViewmodel model, _) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppValues.horizontalPadding),
              child: SizedBox(
                height: screenHeight,
                child: Column(
                  children: [
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/image/dillema_icon.svg',
                      colorFilter: const ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcIn,
                      ),
                      width: 200,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "딜레마 카페",
                      style: AppTextStyles.dillemaDisplay2
                          .copyWith(color: AppColors.primary, fontSize: 50),
                    ),
                    const Spacer(),
                    LoginButton(
                      height: 50,
                      leadingIcon: SvgPicture.asset(
                        "assets/image/kakaotalk.svg",
                        width: 25,
                      ),
                      buttonTitle: "카카오로 로그인",
                      onTapFunction: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            RoutePaths.Home, (route) => false);
                      },
                      backgroundColor: AppColors.kakao,
                      textColor: AppColors.black,
                    ),
                    const SizedBox(height: 15),
                    LoginButton(
                      height: 50,
                      leadingIcon: SvgPicture.asset(
                        "assets/image/google.svg",
                        width: 25,
                      ),
                      buttonTitle: "구글로 로그인",
                      onTapFunction: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            RoutePaths.Home, (route) => false);
                      },
                      backgroundColor: AppColors.white,
                      textColor: AppColors.black,
                    ),
                    const SizedBox(height: 15),
                    LoginButton(
                      height: 50,
                      leadingIcon:
                          SvgPicture.asset("assets/image/dillema_icon.svg"),
                      buttonTitle: "애플로 로그인",
                      onTapFunction: () {},
                      backgroundColor: AppColors.black,
                      textColor: AppColors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
