class Reserve {
  final String fromDate;
  final String toDate;
  final int appartementId;

  Reserve({
    required this.fromDate,
    required this.toDate,
    required this.appartementId,
  });

  // Factory method to create a Reverse instance from JSON
  factory Reserve.fromJson(Map<String, dynamic> json) {
    return Reserve(
      fromDate: json['fromdate'],
      toDate: json['todate'],
      appartementId: json['appartementid'],
    );
  }

  // Method to convert a Reverse instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'fromdate': fromDate,
      'todate': toDate,
      'appartementid': appartementId,
    };
  }
}
