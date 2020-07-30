import 'package:json_annotation/json_annotation.dart';

part 'ActivityBean.g.dart';

@JsonSerializable()
class ActivityBean{
  var id;
  String  adrUrl;
  String imgUrl;
  String title;

  //首页banner数据
  String bannerdec;//标题
  String bannerimg;//图片
  String spare3;//跳转链接

  //首页icon数据
  String iconpara;//跳转链接
  String icondec; //标题
  String iconimg;//图片

  //首页theme主题场
  int type;//选品库类型，1：普通类型，2高佣金类型
  String favoritesId;
  String favoritesTitle;

  ActivityBean({
    this.id, this.adrUrl,this.imgUrl,this.title,
    this.bannerdec,this.bannerimg,this.spare3,
    this.iconpara,this.icondec,this.iconimg,
    this.type,this.favoritesId,this.favoritesTitle
  });

  //不同的类使用不同的mixin即可
  factory ActivityBean.fromJson(Map<String, dynamic> json) => _$ActivityBeanFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityBeanToJson(this);

}