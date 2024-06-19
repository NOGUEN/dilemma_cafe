import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/provider_setup.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:dillema_cafe/ui/router.dart' as router;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setString('BASE_URL', dotenv.env['BASE_URL'] ?? "");
  prefs.setString('ANON_KEY', dotenv.env['ANON_KEY'] ?? "");

  await Supabase.initialize(
    url: prefs.getString('BASE_URL') ?? '',
    anonKey: prefs.getString('ANON_KEY') ?? '',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            iconTheme: IconThemeData(
              color: AppColors.primary,
            ),
            actionsIconTheme: IconThemeData(
              color: AppColors.white,
            ),
          ),
        ),
        initialRoute: RoutePaths.Login,
        onGenerateRoute: router.Router.generateRoute,
      ),
    );
  }
}
