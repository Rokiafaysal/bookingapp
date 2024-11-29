class User {
  final int id;
  final String myPassword;
  final String username;
  final String email;
  final String phone;
  final String country;
  final int userType;

  User({
    required this.id,
    required this.myPassword,
    required this.username,
    required this.email,
    required this.phone,
    required this.country,
    required this.userType,
  });

  // Factory method to create a GUserToSave instance from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      myPassword: json['myPassword'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      country: json['country'],
      userType: json['usertype'],
    );
  }

  // Method to convert a GUserToSave instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'myPassword': myPassword,
      'username': username,
      'email': email,
      'phone': phone,
      'country': country,
      'usertype': userType,
    };
  }
}
