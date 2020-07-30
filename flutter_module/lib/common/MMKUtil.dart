import 'package:shared_preferences/shared_preferences.dart';

class MMKUtil{
  static bool ifBootHome=true;//是否启动的首页
  static Future<bool> getBoolean(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key)==null?false:prefs.getBool(key);
  }
  static void putBoolean(String key,bool value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key,value);
  }

  static Future<String> getString(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key)==null?"":prefs.getString(key);
  }

  static void putString(String key,String value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key,value);
  }
}