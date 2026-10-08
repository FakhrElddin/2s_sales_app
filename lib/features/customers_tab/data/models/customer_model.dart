import 'package:twos_home_wear_app/features/customers_tab/domain/entities/customer_entity.dart';

class CustomerModel extends CustomerEntity {
  CustomerModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.city,
    required super.email,
    required super.street,
  });
  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      phone: (json['phone'] is String) ? json['phone'] as String : '',
      city: (json['city'] is String) ? json['city'] as String : '',
      email: (json['email'] is String) ? json['email'] as String : '',
      street: (json['street'] is String) ? json['street'] as String : '',
    );
  }
}
