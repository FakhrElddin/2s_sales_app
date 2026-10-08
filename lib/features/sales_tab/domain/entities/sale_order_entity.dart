class SaleOrderEntity {
  final int id;
  final String orderNumber;
  final String customerName;
  final String date;
  final String status;
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
