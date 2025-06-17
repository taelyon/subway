class ArrivalInfo {
  final String trainLineName;
  final String arrivalMessage;

  ArrivalInfo({required this.trainLineName, required this.arrivalMessage});

  factory ArrivalInfo.fromJson(Map<String, dynamic> json) {
    return ArrivalInfo(
      trainLineName: json['trainLineNm'] as String,
      arrivalMessage: json['arvlMsg2'] as String,
    );
  }
}
