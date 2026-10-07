import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twos_home_wear_app/core/di/di.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/core/widgets/custom_text_form_field.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/manager/customers_cubit/customers_cubit.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customers_tab_app_bar.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customers_list_view.dart';

class CustomersTab extends StatefulWidget {
  const CustomersTab({super.key});

  @override
  State<CustomersTab> createState() => _CustomersTabState();
}

class _CustomersTabState extends State<CustomersTab> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CustomersCubit>()..getCustomers(),
      child: SafeArea(
        child: Column(
          children: [
            CustomTabAppBar(title: 'Customers'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 14),
                    CustomTextFormField(
                      controller: searchController,
                      hintText: 'Search customers...',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.greyColor,
                        size: 22,
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 14),
                    Expanded(
                      child: BlocBuilder<CustomersCubit, CustomersState>(
                        builder: (context, state) {
                          if (state is CustomersSuccess) {
                            return CustomersListView(
                              customers: state.customers,
                            );
                          } else if (state is CustomersError) {
                            return Center(
                              child: Text(state.failure.errorMessage),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            );
                          }
                        },
                      ),
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
