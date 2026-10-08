import 'package:hive/hive.dart';
part 'customer_entity.g.dart';

@HiveType(typeId: 0)
class CustomerEntity {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? phone;
  @HiveField(3)
  final String? city;
  @HiveField(4)
  final String? email;
  @HiveField(5)
  final String? street;
  CustomerEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.city,
    required this.email,
    required this.street,
  });
}
