class SalesOrderModel {
  const SalesOrderModel({
    required this.orderNumber,
    required this.customerName,
    required this.amount,
    required this.date,
    required this.status,
  });

  final String orderNumber;
  final String customerName;
  final String amount;
  final String date;
  final String status;
}
