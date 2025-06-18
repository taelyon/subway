class ArrivalInfo {
  final String subwayId;
  final String updnLine;
  final String trainLineName;
  final String statnFid;
  final String statnTid;
  final String statnId;
  final String statnNm;
  final String trnsitCo;
  final String ordkey;
  final String subwayList;
  final String statnList;
  final String btrainSttus;
  final String barvlDt;
  final String btrainNo;
  final String bstatnId;
  final String bstatnNm;
  final String recptnDt;
  final String arrivalMessage;
  final String arrivalMessage3;
  final String arrivalCode;
  final String lastTrain;

  ArrivalInfo({
    required this.subwayId,
    required this.updnLine,
    required this.trainLineName,
    required this.statnFid,
    required this.statnTid,
    required this.statnId,
    required this.statnNm,
    required this.trnsitCo,
    required this.ordkey,
    required this.subwayList,
    required this.statnList,
    required this.btrainSttus,
    required this.barvlDt,
    required this.btrainNo,
    required this.bstatnId,
    required this.bstatnNm,
    required this.recptnDt,
    required this.arrivalMessage,
    required this.arrivalMessage3,
    required this.arrivalCode,
    required this.lastTrain,
  });

  factory ArrivalInfo.fromJson(Map<String, dynamic> json) {
    return ArrivalInfo(
      subwayId: json['subwayId'].toString(),
      updnLine: json['updnLine'] as String,
      trainLineName: json['trainLineNm'] as String,
      statnFid: json['statnFid'].toString(),
      statnTid: json['statnTid'].toString(),
      statnId: json['statnId'].toString(),
      statnNm: json['statnNm'] as String,
      trnsitCo: json['trnsitCo'].toString(),
      ordkey: json['ordkey'] as String,
      subwayList: json['subwayList'] as String,
      statnList: json['statnList'] as String,
      btrainSttus: json['btrainSttus'] as String? ?? '',
      barvlDt: json['barvlDt'].toString(),
      btrainNo: json['btrainNo'] as String? ?? '',
      bstatnId: json['bstatnId'].toString(),
      bstatnNm: json['bstatnNm'] as String? ?? '',
      recptnDt: json['recptnDt'] as String,
      arrivalMessage: json['arvlMsg2'] as String,
      arrivalMessage3: json['arvlMsg3'] as String? ?? '',
      arrivalCode: json['arvlCd'].toString(),
      lastTrain: json['lstcarAt'].toString(),
    );
  }
}
