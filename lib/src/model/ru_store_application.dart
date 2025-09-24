class RuStoreApplication {
  final int versionId;
  final String appName;
  final String appType;
  final String versionName;
  final int versionCode;
  final String versionStatus;
  final String publishType;
  final String? testingType;
  final DateTime publishDateTime;
  final DateTime sendDateForModer;
  final int partialValue;
  final String whatsNew;
  final int priceValue;
  final bool paid;
  RuStoreApplication({
    required this.versionId,
    required this.appName,
    required this.appType,
    required this.versionName,
    required this.versionCode,
    required this.versionStatus,
    required this.publishType,
    this.testingType,
    required this.publishDateTime,
    required this.sendDateForModer,
    required this.partialValue,
    required this.whatsNew,
    required this.priceValue,
    required this.paid,
  });

  factory RuStoreApplication.fromJson(Map<String, dynamic> json) {
    return RuStoreApplication(
      versionId: json['versionId']??0,
      appName: json['appName']??'',
      appType: json['appType']??'',
      versionName: json['versionName']??'',
      versionCode: json['versionCode']??0,
      versionStatus: json['versionStatus']??'',
      publishType: json['publishType']??'',
      testingType: json['testingType']??'',
      publishDateTime: json['publishDateTime'] != null ? DateTime.parse(json['publishDateTime']) : DateTime.now(),
      sendDateForModer: json['sendDateForModer'] != null ? DateTime.parse(json['sendDateForModer']) : DateTime.now(),
      partialValue: json['partialValue']??0,
      whatsNew: json['whatsNew']??'',
      priceValue: json['priceValue']??0,
      paid: json['paid']??false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'versionId': versionId,
      'appName': appName,
      'appType': appType,
      'versionName': versionName,
      'versionCode': versionCode,
      'versionStatus': versionStatus,
      'publishType': publishType,
      'testingType': testingType,
      'publishDateTime': publishDateTime.toIso8601String(),
      'sendDateForModer': sendDateForModer.toIso8601String(),
      'partialValue': partialValue,
      'whatsNew': whatsNew,
      'priceValue': priceValue,
      'paid': paid,
    };
  }
}
