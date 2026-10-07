import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/core/utils/app_styles.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/models/customer_model.dart';

class CustomerProfileHeaderCard extends StatelessWidget {
  const CustomerProfileHeaderCard({super.key, required this.customer});

  final CustomerModel customer;

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
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                customer.initials,
                style: AppStyles.bold20Text.copyWith(color: AppColors.whiteColor),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    customer.name,
                    style: AppStyles.bold20Text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.cardBorderColor,
                      borderRadius: BorderRadius.circular(9999),
                    ),
                    child: Text(
                      'Customer',
                      style: AppStyles.semiBold12Text.copyWith(
                        color: AppColors.labelTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
