class User {
  final String id;
  final String name;
  final String phoneNumber;

  const User({
    required this.id,
    required this.name,
    required this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber']
    );
  }
}
