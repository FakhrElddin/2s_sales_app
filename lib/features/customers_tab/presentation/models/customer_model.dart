class CustomerModel {
  const CustomerModel({
    required this.name,
    required this.phoneNumber,
    required this.city,
    required this.initials,
    this.email = 'ahmed.hassan@example.com',
    this.address = '15 El-Tahrir Square, Cairo',
  });

  final String name;
  final String phoneNumber;
  final String city;
  final String initials;
  final String email;
  final String address;
}
