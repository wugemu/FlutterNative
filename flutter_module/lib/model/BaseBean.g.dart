// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BaseBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseBean _$BaseBeanFromJson(Map<String, dynamic> json) {
  return BaseBean(
    status: json['status'] as int,
    message: json['message'] as String,
    data: json['data'],
  );
}

Map<String, dynamic> _$BaseBeanToJson(BaseBean instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
