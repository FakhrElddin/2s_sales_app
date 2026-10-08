import 'package:twos_home_wear_app/features/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    required super.uid,
    required super.name,
    required super.email,
    required super.isInternalUser,
    required super.companyName,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    final result = json['result'] ?? {};
    return LoginModel(
      uid: result['uid'] ?? 0,
      name: result['name'] ?? '',
      email: result['username'] ?? '',
      isInternalUser: result['is_internal_user'] ?? false,
      companyName: '2S Homewear',
    );
  }
}
