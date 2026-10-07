import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/entities/customer_entity.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customer_details_app_bar.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customer_info_card.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customer_phone_card.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customer_profile_header_card.dart';

class CustomerDetailsScreen extends StatelessWidget {
  const CustomerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customerData =
        ModalRoute.of(context)?.settings.arguments as CustomerEntity;

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
                    CustomerProfileHeaderCard(customer: customerData),
                    const SizedBox(height: 16),
                    CustomerPhoneCard(
                      phoneNumber: customerData.phone ?? '+20 ',
                    ),
                    const SizedBox(height: 16),
                    CustomerInfoCard(
                      email: customerData.email!,
                      address: customerData.street!,
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
