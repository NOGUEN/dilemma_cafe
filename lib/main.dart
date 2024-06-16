import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/provider_setup.dart';
import 'package:provider/provider.dart';
import 'package:dillema_cafe/ui/router.dart' as router;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Dillema Cafe',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: AppColors.primary,
            scaffoldBackgroundColor: AppColors.background,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.background,
            )),
        initialRoute: RoutePaths.Home,
        onGenerateRoute: router.Router.generateRoute,
      ),
    );
  }
}
