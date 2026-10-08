import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/core/utils/app_styles.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customer_info_tile.dart';

class CustomerInfoCard extends StatelessWidget {
  const CustomerInfoCard({
    super.key,
    required this.email,
    required this.address,
  });

  final String email;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.cardBorderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Information', style: AppStyles.semiBold16Text),
            const SizedBox(height: 12),
            CustomerInfoTile(
              icon: Icons.email_outlined,
              label: 'Email',
              value: email,
            ),
            const SizedBox(height: 12),
            CustomerInfoTile(
              icon: Icons.location_on_outlined,
              label: 'Address',
              value: address,
            ),
          ],
        ),
      ),
    );
  }
}
