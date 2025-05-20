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
      versionId: json['versionId'],
      appName: json['appName'],
      appType: json['appType'],
      versionName: json['versionName'],
      versionCode: json['versionCode'],
      versionStatus: json['versionStatus'],
      publishType: json['publishType'],
      testingType: json['testingType'],
      publishDateTime: DateTime.parse(json['publishDateTime']),
      sendDateForModer: DateTime.parse(json['sendDateForModer']),
      partialValue: json['partialValue'],
      whatsNew: json['whatsNew'],
      priceValue: json['priceValue'],
      paid: json['paid'],
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
