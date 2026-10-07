import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/models/customer_model.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customer_card.dart';

class CustomersListView extends StatelessWidget {
  const CustomersListView({super.key, required this.customers, this.onTap});

  final List<CustomerModel> customers;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: customers.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final customer = customers[index];
        return CustomerCard(customer: customer, onTap: onTap);
      },
    );
  }
}
