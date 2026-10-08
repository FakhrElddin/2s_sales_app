import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/entities/customer_entity.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/manager/customers_cubit/customers_cubit.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customer_details_app_bar.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customer_info_card.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customer_phone_card.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customer_profile_header_card.dart';

class CustomerDetailsScreen extends StatelessWidget {
  const CustomerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments! as Map<String, dynamic>;
    final customerData = args['customer'] as CustomerEntity;
    final customersCubit = args['customers_cubit'] as CustomersCubit;

    return BlocProvider.value(
      value: customersCubit,
      child: Scaffold(
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
                      CustomerPhoneCard(customer: customerData),
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
      ),
    );
  }
}
