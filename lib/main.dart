import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/config/app_routes.dart';
import 'package:twos_home_wear_app/core/config/app_themes.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/screens/customer_details_screen.dart';
import 'package:twos_home_wear_app/features/home/presentation/screens/home_screen.dart';
import 'package:twos_home_wear_app/features/login/presentation/screens/login_screen.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/screens/order_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.loginScreenRoute: (context) => LoginScreen(),
        AppRoutes.homeScreenRoute: (context) => HomeScreen(),
        AppRoutes.customerDetailsScreenRoute: (context) =>
            CustomerDetailsScreen(),
        AppRoutes.orderDetailsScreenRoute: (context) => OrderDetailsScreen(),
      },
      initialRoute: AppRoutes.homeScreenRoute,
      theme: AppThemes.lightTheme,
    );
  }
}
