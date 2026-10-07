class LoginEntity {
  String? uid;
  String? name;
  String? email;
  bool? isInternalUser;
  String? companyName;

  LoginEntity({
    required this.uid,
    required this.name,
    required this.email,
    required this.isInternalUser,
    required this.companyName,
  });
}
