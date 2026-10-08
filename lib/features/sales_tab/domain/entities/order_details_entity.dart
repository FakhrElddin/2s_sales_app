import 'package:hive/hive.dart';

part 'order_details_entity.g.dart';

@HiveType(typeId: 2)
class OrderDetailsEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String productName;
  @HiveField(2)
  final double quantity;
  @HiveField(3)
  final double priceUnit;
  @HiveField(4)
  final double priceSubtotal;

  const OrderDetailsEntity({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.priceUnit,
    required this.priceSubtotal,
  });
}