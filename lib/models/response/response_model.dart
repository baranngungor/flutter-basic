import 'package:userapp/models/response/meta/meta_model.dart';

class ResponseModel {
  bool? success;
  late MetaModel meta;
  var data;
  ResponseModel({required this.success, required this.meta, this.data});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    meta = MetaModel.fromJson(json['meta']);
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['meta'] = meta.toJson();
    data['data'] = data;
    return data;
  }
}
