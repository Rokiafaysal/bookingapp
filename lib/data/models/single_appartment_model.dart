class SingleAppartmentModel {
  final int id;
  final String name;
  final String userId;
  final List<Detail> dtl;

  SingleAppartmentModel({
    required this.id,
    required this.name,
    required this.userId,
    required this.dtl,
  });

  factory SingleAppartmentModel.fromJson(Map<String, dynamic> json) {
    return SingleAppartmentModel(
      id: json['id'] as int,
      name: json['name'] as String,
      userId: json['userid'] as String,
      dtl: (json['dtl'] as List<dynamic>)
          .map((item) => Detail.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'userid': userId,
      'dtl': dtl.map((item) => item.toJson()).toList(),
    };
  }
}

class Detail {
  final int reverseId;
  final String fromDate;
  final String toDate;
  final int appartementId;
  final String note;

  Detail(
      {required this.reverseId,
      required this.fromDate,
      required this.toDate,
      required this.appartementId,
      required this.note});

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      reverseId: json['id'] as int,
      fromDate: json['fromdate'] as String,
      note: json['notes'] as String,
      toDate: json['todate'] as String,
      appartementId: json['appartementid'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reverseid': reverseId,
      'fromdate': fromDate,
      'todate': toDate,
      'appartementid': appartementId,
    };
  }
}
