import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/core/models/json_models/dillema_model.dart';
import 'package:dillema_cafe/ui/views/all_dillema_view.dart';
import 'package:dillema_cafe/ui/views/dillema_view.dart';
import 'package:dillema_cafe/ui/views/login_view.dart';
import 'package:dillema_cafe/ui/views/my_page_view.dart';
import 'package:dillema_cafe/ui/views/ticket_store_view.dart';
import 'package:flutter/material.dart';
import 'package:dillema_cafe/ui/views/home_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutePaths.Dillema:
        final dillema = settings.arguments as DillemaModel;

        return MaterialPageRoute(
            builder: (_) => DillemaView(
                  dillemaModel: dillema,
                ));
      case RoutePaths.AllDillema:
        return MaterialPageRoute(builder: (_) => AllDillemaView());
      case RoutePaths.MyPage:
        return MaterialPageRoute(builder: (_) => MyPageView());
      case RoutePaths.Ticket:
        return MaterialPageRoute(builder: (_) => TicketStoreView());
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (_) => LoginView());
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
