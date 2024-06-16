import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/ui/views/dillema_view.dart';
import 'package:flutter/material.dart';
import 'package:dillema_cafe/ui/views/home_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutePaths.Dillema:
        return MaterialPageRoute(builder: (_) => DillemaView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
