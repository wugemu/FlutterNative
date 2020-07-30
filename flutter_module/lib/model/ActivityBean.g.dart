// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ActivityBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityBean _$ActivityBeanFromJson(Map<String, dynamic> json) {
  return ActivityBean(
    id: json['id'],
    adrUrl: json['adrUrl'] as String,
    imgUrl: json['imgUrl'] as String,
    title: json['title'] as String,
    bannerdec: json['bannerdec'] as String,
    bannerimg: json['bannerimg'] as String,
    spare3: json['spare3'] as String,
    iconpara: json['iconpara'] as String,
    icondec: json['icondec'] as String,
    iconimg: json['iconimg'] as String,
    type: json['type'] as int,
    favoritesId: json['favoritesId'] as String,
    favoritesTitle: json['favoritesTitle'] as String,
  );
}

Map<String, dynamic> _$ActivityBeanToJson(ActivityBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'adrUrl': instance.adrUrl,
      'imgUrl': instance.imgUrl,
      'title': instance.title,
      'bannerdec': instance.bannerdec,
      'bannerimg': instance.bannerimg,
      'spare3': instance.spare3,
      'iconpara': instance.iconpara,
      'icondec': instance.icondec,
      'iconimg': instance.iconimg,
      'type': instance.type,
      'favoritesId': instance.favoritesId,
      'favoritesTitle': instance.favoritesTitle,
    };
