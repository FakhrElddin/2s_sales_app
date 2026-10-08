import 'package:twos_home_wear_app/features/sales_tab/domain/entities/sale_order_entity.dart';

class SaleOrderModel extends SaleOrderEntity {
  const SaleOrderModel({
    required super.id,
    required super.orderNumber,
    required super.customerName,
    required super.date,
    required super.status,
    required super.amountTotal,
  });

  factory SaleOrderModel.fromJson(Map<String, dynamic> json) {
    String customer = '';
    if (json['partner_id'] is List &&
        (json['partner_id'] as List).length >= 2) {
      customer = json['partner_id'][1].toString();
    }

    return SaleOrderModel(
      id: json['id'] as int? ?? 0,
      orderNumber: (json['name'] is String) ? json['name'] as String : '',
      customerName: customer,
      date: (json['date_order'] is String) ? json['date_order'] as String : '',
      status: (json['state'] is String) ? json['state'] as String : 'draft',
      amountTotal: (json['amount_total'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
