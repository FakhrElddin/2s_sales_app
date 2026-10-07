import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/core/widgets/custom_text_form_field.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/models/customer_model.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customers_tab_app_bar.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customers_list_view.dart';

class CustomersTab extends StatefulWidget {
  const CustomersTab({super.key});

  @override
  State<CustomersTab> createState() => _CustomersTabState();
}

class _CustomersTabState extends State<CustomersTab> {
  final TextEditingController searchController = TextEditingController();

  static const List<CustomerModel> mockCustomers = [
    CustomerModel(
      name: 'Ahmed Hassan',
      phoneNumber: '+20 101 234 5678',
      city: 'Cairo',
      initials: 'AH',
    ),
    CustomerModel(
      name: 'Mahmoud El-Sayed',
      phoneNumber: '+20 112 987 6543',
      city: 'Alexandria',
      initials: 'ME',
    ),
    CustomerModel(
      name: 'Fatma Zahran',
      phoneNumber: '+20 100 456 7890',
      city: 'Giza',
      initials: 'FZ',
    ),
    CustomerModel(
      name: 'Karim Abdel-Rahman',
      phoneNumber: '+20 122 345 6789',
      city: 'Cairo',
      initials: 'KA',
    ),
    CustomerModel(
      name: 'Nour El-Din',
      phoneNumber: '+20 115 678 1234',
      city: 'Tanta',
      initials: 'ND',
    ),
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomersTabAppBar(),
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
                    child: CustomersListView(
                      customers: mockCustomers,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
