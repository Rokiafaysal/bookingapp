class AppartementSendModel {
  final String name;

  AppartementSendModel({
    required this.name,
  });

  // Factory method to create an Appartement instance from JSON
  factory AppartementSendModel.fromJson(Map<String, dynamic> json) {
    return AppartementSendModel(
      name: json['name'],
    );
  }

  // Method to convert an Appartement instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
