import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_module/model/ActivityBean.dart';
part 'TBHomeBean.g.dart';

@JsonSerializable()
class TBHomeBean{
  List<ActivityBean> bannersList;
  List<ActivityBean> iconsList;
  String tbPid;
  dynamic guessMid;

  TBHomeBean({
    this.bannersList,this.iconsList,this.tbPid,this.guessMid
  });

  //不同的类使用不同的mixin即可
  factory TBHomeBean.fromJson(Map<String, dynamic> json) => _$TBHomeBeanFromJson(json);
  Map<String, dynamic> toJson() => _$TBHomeBeanToJson(this);
}