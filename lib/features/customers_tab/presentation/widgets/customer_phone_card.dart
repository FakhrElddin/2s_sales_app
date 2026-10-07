import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/core/utils/app_styles.dart';

class CustomerPhoneCard extends StatefulWidget {
  const CustomerPhoneCard({
    super.key,
    required this.phoneNumber,
    this.onUpdatePhone,
  });

  final String phoneNumber;
  final void Function()? onUpdatePhone;

  @override
  State<CustomerPhoneCard> createState() => _CustomerPhoneCardState();
}

class _CustomerPhoneCardState extends State<CustomerPhoneCard> {
  late final TextEditingController phoneController;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController(text: widget.phoneNumber);
  }

  @override
  void didUpdateWidget(covariant CustomerPhoneCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.phoneNumber != widget.phoneNumber) {
      phoneController.text = widget.phoneNumber;
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    focusNode.dispose();
    super.dispose();
  }

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
            const Row(
              children: [
                Icon(
                  Icons.phone_outlined,
                  size: 16,
                  color: AppColors.textPrimaryColor,
                ),
                SizedBox(width: 8),
                Text('Phone Number', style: AppStyles.semiBold16Text),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.containerBackgroundColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.cardBorderColor),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      focusNode: focusNode,
                      keyboardType: TextInputType.phone,
                      style: AppStyles.semiBold16Text,
                      decoration: const InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      focusNode.requestFocus();
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.edit_outlined,
                        size: 16,
                        color: AppColors.textSecondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Material(
                color: AppColors.transparentColor,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: widget.onUpdatePhone,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.save_outlined,
                        size: 16,
                        color: AppColors.whiteColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Update Phone',
                        style: AppStyles.semiBold14Text.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
