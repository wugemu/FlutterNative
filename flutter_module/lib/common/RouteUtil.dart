import 'package:flutter/material.dart';
import 'package:flutter_module/common/LangUtil.dart';
import 'package:flutter_module/common/MMKUtil.dart';
import 'package:flutter_module/common/Const.dart';
import 'package:flutter_module/common/LogUtil.dart';
import 'package:flutter_module/route/web/InappWebviewR.dart';
class RouteUtil{
  //路由表
  static final String ROUTE_INAPPWEB="InappWebviewR";

  //命名路由
  static Map<String, WidgetBuilder> initRouteMap(BuildContext context){
    Map<String, WidgetBuilder> routeMap={
      ROUTE_INAPPWEB:(context)=>InappWebviewR(url: ""),
    };
    return routeMap;
  }

  static bool goWhere(BuildContext context,String adrUrl){
    if (LangUtil.isEmptyStr(adrUrl)) {
      return false;
    }
    LogUtil.showLog("gotype跳转链接：$adrUrl");
    String gotype = LangUtil.getUrlParma(adrUrl, "gotype");
    if(LangUtil.isEmptyStr(gotype)){
      //没有gotype 但是链接不为空默认到H5
      if(adrUrl.startsWith("http")){
        gotype = "100";
      }else{
        gotype="0";
      }
    }
    if(!LangUtil.isNumericStr(gotype)){
      return false;
    }
    switch(int.parse(gotype)){
      case 1:
        //天猫淘宝主题场
        return true;
      case 2:
        //京东主题场
        return true;
      case 99:
        //跳转登录
        return true;
      case 100:
        //H5
        Navigator.of(context).pushNamed(ROUTE_INAPPWEB, arguments: adrUrl);

        //测试
//        Navigator.of(context).pushNamed(ROUTE_INAPPWEB, arguments: adrUrl);
        return true;
      case 199:
        //返回 退出当前页面
        Navigator.pop(context);
        return true;
      case 200:
        //跳转至首页
        popUntil(context,"/");
        return true;
      case 201:
        //跳转至首页加载新的链接
        return true;
    }
    return false;
  }

  //跳转至指定路由
  static void popUntil(BuildContext context,String rountName){
    Navigator.popUntil(context, ModalRoute.withName(rountName));
  }

  //自定义切换路由
  static Widget initRoute(String adrUrl){
    if (LangUtil.isEmptyStr(adrUrl)) {
      return null;
    }
    LogUtil.showLog("gotype跳转链接：$adrUrl");
    String gotype = LangUtil.getUrlParma(adrUrl, "gotype");
    if(LangUtil.isEmptyStr(gotype)){
      //没有gotype 但是链接不为空默认到H5
      if(adrUrl.startsWith("http")){
        gotype = "100";
      }else{
        gotype="0";
      }
    }
    if(!LangUtil.isNumericStr(gotype)){
      return null;
    }
    switch(int.parse(gotype)){
      case 1:
      //天猫淘宝主题场
        return null;
      case 2:
      //京东主题场
        return null;
      case 99:
      //跳转登录
        return null;
      case 100:
        return InappWebviewR(url: adrUrl);
    }
    return null;
  }
}
