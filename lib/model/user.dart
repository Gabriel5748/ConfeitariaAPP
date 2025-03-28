class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String? address;
  final String? phone;
  final List<String>? preferences;
  final String? about;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.address,
    this.phone,
    this.preferences,
    this.about,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'phone': phone,
      'preferences': preferences,
      'about': about,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      password: json['password']?.toString() ?? '',
      address: json['address']?.toString(),
      phone: json['phone']?.toString(),
      preferences: (json['preferences'] as List<dynamic>?)?.cast<String>(),
      about: json['about']?.toString(),
    );
  }
} 