import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/screens/sales_tab.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/sales_order_card.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/sales_order_filter_bar.dart';

void main() {
  testWidgets('SalesTab renders app bar, filter bar, and cards', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SalesTab(),
        ),
      ),
    );

    // Verify CustomTabAppBar title
    expect(find.text('Sales Orders'), findsWidgets);

    final filterBarFinder = find.byType(SalesOrderFilterBar);

    // Verify filter tabs within filter bar
    expect(
      find.descendant(of: filterBarFinder, matching: find.text('All')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: filterBarFinder, matching: find.text('Quotations')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: filterBarFinder, matching: find.text('Confirmed')),
      findsOneWidget,
    );

    // Verify 4 sales order cards displayed initially
    expect(find.byType(SalesOrderCard), findsNWidgets(4));

    // Tap on Quotations filter tab
    await tester.tap(
      find.descendant(of: filterBarFinder, matching: find.text('Quotations')),
    );
    await tester.pumpAndSettle();

    // Verify UI remains static: all 4 cards still displayed without applying filter
    expect(find.byType(SalesOrderCard), findsNWidgets(4));

    // Tap on Confirmed filter tab
    await tester.tap(
      find.descendant(of: filterBarFinder, matching: find.text('Confirmed')),
    );
    await tester.pumpAndSettle();

    // Verify UI remains static: all 4 cards still displayed without applying filter
    expect(find.byType(SalesOrderCard), findsNWidgets(4));
  });
}


