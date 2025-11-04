import 'package:LCVFlutterSDK/core/network/result.dart';

class DataModel<T> {
  final int? statusCode;
  final T? data;

  DataModel({this.statusCode, this.data});

  factory DataModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) parser,
  ) {
    return DataModel<T>(
      statusCode: json['statusCode'] as int?,
      data:
          json['data'] != null
              ? parser(json['data'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T value) toJsonT) {
    return {
      'statusCode': statusCode,
      'data': data != null ? toJsonT(data!) : null,
    };
  }
}
