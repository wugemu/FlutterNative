import 'package:json_annotation/json_annotation.dart';

part 'BaseBean.g.dart';

@JsonSerializable()
class BaseBean{
  static const int STATUS_SUCCESS=1000;
  int status;
  String message;
  dynamic data;

  BaseBean({
    this.status,
    this.message,
    this.data
  });

  //不同的类使用不同的mixin即可
  factory BaseBean.fromJson(Map<String, dynamic> json) => _$BaseBeanFromJson(json);
  Map<String, dynamic> toJson() => _$BaseBeanToJson(this);
}