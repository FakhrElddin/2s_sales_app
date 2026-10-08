import 'package:twos_home_wear_app/features/sales_tab/domain/entities/order_details_entity.dart';

class OrderDetailsModel extends OrderDetailsEntity {
  const OrderDetailsModel({
    required super.id,
    required super.productName,
    required super.quantity,
    required super.priceUnit,
    required super.priceSubtotal,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    String productName = '';
    if (json['name'] is String && (json['name'] as String).isNotEmpty) {
      productName = json['name'] as String;
    } else if (json['product_id'] is List &&
        (json['product_id'] as List).length >= 2) {
      productName = json['product_id'][1].toString();
    }

    return OrderDetailsModel(
      id: json['id'] as int? ?? 0,
      productName: productName,
      quantity: (json['product_uom_qty'] as num?)?.toDouble() ?? 0.0,
      priceUnit: (json['price_unit'] as num?)?.toDouble() ?? 0.0,
      priceSubtotal: (json['price_subtotal'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
