class EditUser {
  final int id;
  final String myPassword;

  EditUser({
    required this.id,
    required this.myPassword,
  });

  // Factory method to create an EditUser instance from JSON
  factory EditUser.fromJson(Map<String, dynamic> json) {
    return EditUser(
      id: json['id'],
      myPassword: json['myPassword'],
    );
  }

  // Method to convert an EditUser instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'myPassword': myPassword,
    };
  }
}
