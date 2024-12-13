class Reserve {
  final String fromDate;
  final String toDate;
  final int appartementId;
  final String notes;

  Reserve(
      {required this.fromDate,
      required this.toDate,
      required this.appartementId,
      required this.notes});

  // Factory method to create a Reverse instance from JSON
  factory Reserve.fromJson(Map<String, dynamic> json) {
    return Reserve(
        fromDate: json['fromdate'],
        toDate: json['todate'],
        appartementId: json['appartementid'],
        notes: json['notes']);
  }

  // Method to convert a Reverse instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'fromdate': fromDate,
      'todate': toDate,
      'appartementid': appartementId,
      'notes': notes
    };
  }
}
