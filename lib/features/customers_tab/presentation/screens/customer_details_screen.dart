import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/models/customer_model.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customer_details_app_bar.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customer_info_card.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customer_phone_card.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customer_profile_header_card.dart';

class CustomerDetailsScreen extends StatelessWidget {
  const CustomerDetailsScreen({
    super.key,
    this.customer,
  });

  final CustomerModel? customer;

  static const CustomerModel _defaultCustomer = CustomerModel(
    name: 'Ahmed Hassan',
    phoneNumber: '+20 101 234 5678',
    city: 'Cairo',
    initials: 'AH',
    email: 'ahmed.hassan@example.com',
    address: '15 El-Tahrir Square, Cairo',
  );

  @override
  Widget build(BuildContext context) {
    final routeCustomer =
        ModalRoute.of(context)?.settings.arguments as CustomerModel?;
    final currentCustomer = customer ?? routeCustomer ?? _defaultCustomer;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const CustomerDetailsAppBar(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    CustomerProfileHeaderCard(customer: currentCustomer),
                    const SizedBox(height: 16),
                    CustomerPhoneCard(
                      phoneNumber: currentCustomer.phoneNumber,
                    ),
                    const SizedBox(height: 16),
                    CustomerInfoCard(
                      email: currentCustomer.email,
                      address: currentCustomer.address,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
