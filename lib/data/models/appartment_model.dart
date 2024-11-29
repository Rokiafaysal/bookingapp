class AppartementModel {
  final int id;
  final String name;
  final String userId;

  AppartementModel({
    required this.id,
    required this.name,
    required this.userId,
  });

  // Factory method to create an Appartement instance from JSON
  factory AppartementModel.fromJson(Map<String, dynamic> json) {
    return AppartementModel(
      id: json['id'],
      name: json['name'],
      userId: json['userid'],
    );
  }

  // Method to convert an Appartement instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'userid': userId,
    };
  }
}
