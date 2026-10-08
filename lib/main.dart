import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/cache/shared_prefs_utils.dart';
import 'package:twos_home_wear_app/core/config/app_routes.dart';
import 'package:twos_home_wear_app/core/config/app_themes.dart';
import 'package:twos_home_wear_app/core/di/di.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/screens/customer_details_screen.dart';
import 'package:twos_home_wear_app/features/home/presentation/screens/home_screen.dart';
import 'package:twos_home_wear_app/features/login/presentation/screens/login_screen.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/screens/order_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsUtils.init();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.loginScreenRoute: (context) => const LoginScreen(),
        AppRoutes.homeScreenRoute: (context) => const HomeScreen(),
        AppRoutes.customerDetailsScreenRoute: (context) =>
            const CustomerDetailsScreen(),
        AppRoutes.orderDetailsScreenRoute: (context) =>
            const OrderDetailsScreen(),
      },
      initialRoute: AppRoutes.loginScreenRoute,
      theme: AppThemes.lightTheme,
    );
  }
}
