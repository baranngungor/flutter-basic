class MetaModel {
  String? requestId, errorType, errorCode, errorMessage;
  int? httpStatusCode;
  MetaModel(
      {required this.requestId,
      required this.httpStatusCode,
      this.errorType,
      this.errorCode,
      this.errorMessage});

  MetaModel.fromJson(Map<String, dynamic> json) {
    requestId = json['requestId'];
    httpStatusCode = json['httpStatusCode'];
    errorType = json['errorType'];
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['requestId'] = requestId;
    data['httpStatusCode'] = httpStatusCode;
    data['errorType'] = errorType;
    data['errorCode'] = errorCode;
    data['errorMessage'] = errorMessage;
    return data;
  }
}
