import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/sales_order_filter_tab_item.dart';

class SalesOrderFilterBar extends StatefulWidget {
  const SalesOrderFilterBar({
    super.key,
    this.initialIndex = 0,
    this.onIndexChanged,
  });

  final int initialIndex;
  final ValueChanged<int>? onIndexChanged;

  @override
  State<SalesOrderFilterBar> createState() => _SalesOrderFilterBarState();
}

class _SalesOrderFilterBarState extends State<SalesOrderFilterBar> {
  late int selectedIndex;
  final List<String> filterTitles = const ['All', 'Quotations', 'Confirmed'];

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFEBEDFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: List.generate(
          filterTitles.length,
          (index) => SalesOrderFilterTabItem(
            title: filterTitles[index],
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
