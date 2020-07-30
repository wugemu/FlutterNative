import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:flutter_module/common/MMKUtil.dart';
import 'package:flutter_module/common/Const.dart';
import 'package:flutter/services.dart';
class LangUtil{
  static double screenWidth;
  static double screenHeight;
  //获取屏幕的宽
  static double getScreenWidth(BuildContext context){
    if(screenWidth!=null&&screenWidth>0){
      return screenWidth;
    }else{
      MediaQueryData queryData = MediaQuery.of(context);
      screenWidth=queryData.size.width;
      screenHeight=queryData.size.height;
      return screenWidth;
    }
  }
  //获取屏幕的高
  static double getScreenHeight(BuildContext context){
    if(screenHeight!=null&&screenHeight>0){
      return screenHeight;
    }else{
      MediaQueryData queryData = MediaQuery.of(context);
      screenWidth=queryData.size.width;
      screenHeight=queryData.size.height;
      return screenHeight;
    }
  }

  //判断字符串是否为空
  static bool isEmptyStr(String str){
    if(str==null){
      return true;
    }
    if(str.isEmpty){
      return true;
    }
    return false;
  }

  //获取链接中的参数
  static String getUrlParma(String url,String key){
    if(isEmptyStr(url)){
      return "";
    }
    String params = url.substring(url.indexOf("?") + 1);
    List<String> paramList=params.split('&');
    if(paramList!=null&&paramList.length>0){
      for(int i=0;i<paramList.length;i++){
        String paramStr=paramList[i];
        if(paramStr.contains(key+"=")){
          List<String> resultArr=paramStr.split('=');
          if(resultArr!=null&&resultArr.length>1){
            return resultArr[1];
          }
        }
      }
    }
    return "";
  }

  static bool isNumericStr(String str){
    return isNumeric(str);
  }

  //退出登录
  static void logout(){
    MMKUtil.putBoolean(Const.KEY_LOGIN,false);
    MMKUtil.putString(Const.KEY_COOKIE, "");
  }

  //修改屏幕横屏
  static void changeDeviceRight(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
    ]);
  }
  //修改屏幕竖屏
  static void changeDeviceUp(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
}