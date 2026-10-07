import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/screens/customers_tab.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/screens/sales_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  final List<Widget> tabs = const [
    CustomersTab(),
    SalesTab(),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedNavIndex,
        onTap: (index) {
          setState(() {
            selectedNavIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Customers'),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Sales Orders',
          ),
        ],
      ),
      body: widget.tabs[selectedNavIndex],
    );
  }
}
