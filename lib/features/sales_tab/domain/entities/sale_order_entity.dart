import 'package:hive/hive.dart';

part 'sale_order_entity.g.dart';

@HiveType(typeId: 1)
class SaleOrderEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String orderNumber;
  @HiveField(2)
  final String customerName;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final String status;
  @HiveField(5)
  final double amountTotal;

  const SaleOrderEntity({
    required this.id,
    required this.orderNumber,
    required this.customerName,
    required this.date,
    required this.status,
    required this.amountTotal,
  });
}
