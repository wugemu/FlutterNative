// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TBHomeBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TBHomeBean _$TBHomeBeanFromJson(Map<String, dynamic> json) {
  return TBHomeBean(
    bannersList: (json['bannersList'] as List)
        ?.map((e) =>
            e == null ? null : ActivityBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    iconsList: (json['iconsList'] as List)
        ?.map((e) =>
            e == null ? null : ActivityBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tbPid: json['tbPid'] as String,
    guessMid: json['guessMid'],
  );
}

Map<String, dynamic> _$TBHomeBeanToJson(TBHomeBean instance) =>
    <String, dynamic>{
      'bannersList': instance.bannersList,
      'iconsList': instance.iconsList,
      'tbPid': instance.tbPid,
      'guessMid': instance.guessMid,
    };
