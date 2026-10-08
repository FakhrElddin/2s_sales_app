import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:twos_home_wear_app/core/cache/shared_prefs_utils.dart';
import 'package:twos_home_wear_app/core/config/app_routes.dart';
import 'package:twos_home_wear_app/core/config/app_themes.dart';
import 'package:twos_home_wear_app/core/di/di.dart';
import 'package:twos_home_wear_app/core/utils/navigator_key.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/entities/customer_entity.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/screens/customer_details_screen.dart';
import 'package:twos_home_wear_app/features/home/presentation/screens/home_screen.dart';
import 'package:twos_home_wear_app/features/login/presentation/screens/login_screen.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/order_details_entity.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/sale_order_entity.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/screens/order_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsUtils.init();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.initFlutter();
  Hive.registerAdapter(CustomerEntityAdapter());
  Hive.registerAdapter(SaleOrderEntityAdapter());
  Hive.registerAdapter(OrderDetailsEntityAdapter());
  configureDependencies();

  String? sessionId = SharedPrefsUtils.getData(key: 'session_id') as String?;
  final String initialRoute = sessionId != null
      ? AppRoutes.homeScreenRoute
      : AppRoutes.loginScreenRoute;

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, this.initialRoute = AppRoutes.loginScreenRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      routes: {
        AppRoutes.loginScreenRoute: (context) => const LoginScreen(),
        AppRoutes.homeScreenRoute: (context) => const HomeScreen(),
        AppRoutes.customerDetailsScreenRoute: (context) =>
            const CustomerDetailsScreen(),
        AppRoutes.orderDetailsScreenRoute: (context) =>
            const OrderDetailsScreen(),
      },
      initialRoute: initialRoute,
      theme: AppThemes.lightTheme,
    );
  }
}
