class OrderDetailsEntity {
  final int id;
  final String productName;
  final double quantity;
  final double priceUnit;
  final double priceSubtotal;

  const OrderDetailsEntity({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.priceUnit,
    required this.priceSubtotal,
  });
}