import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/core/utils/app_styles.dart';
import 'package:twos_home_wear_app/core/widgets/custom_app_dialog.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/entities/customer_entity.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/manager/customers_cubit/customers_cubit.dart';

class CustomerPhoneCard extends StatefulWidget {
  const CustomerPhoneCard({super.key, required this.customer});

  final CustomerEntity customer;

  @override
  State<CustomerPhoneCard> createState() => _CustomerPhoneCardState();
}

class _CustomerPhoneCardState extends State<CustomerPhoneCard> {
  late final TextEditingController phoneController;
  final FocusNode focusNode = FocusNode();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController(
      text: widget.customer.phone ?? '+20 ',
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Card(
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.containerBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.cardBorderColor),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: phoneController,
                        focusNode: focusNode,
                        keyboardType: TextInputType.phone,
                        style: AppStyles.semiBold16Text,
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Phone number must not be empty";
                          }
                          final egyptRegex = RegExp(
                            r'^(?:\+20|0020|0)?1[0125][0-9]{8}$',
                          );
                          if (!egyptRegex.hasMatch(value.trim())) {
                            return "Please enter a valid Egyptian phone number";
                          }
                          return null;
                        },
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
              BlocConsumer<CustomersCubit, CustomersState>(
                listener: (context, state) {
                  if (state is UpdateCustomerPhoneSuccess) {
                    CustomAppDialog.showSuccess(
                      context: context,
                      title: 'Success',
                      description: 'Customer phone updated successfully',
                    );
                  } else if (state is UpdateCustomerPhoneError) {
                    CustomAppDialog.showError(
                      context: context,
                      title: 'Error',
                      description: state.failure.errorMessage,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is UpdateCustomerPhoneLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  } else {
                    return Container(
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
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<CustomersCubit>(context)
                                  .updateUserPhone(
                                    customerId: widget.customer.id!,
                                    phone: phoneController.text,
                                  );
                            } else {
                              setState(() {
                                autoValidateMode = AutovalidateMode.always;
                              });
                            }
                          },
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
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
