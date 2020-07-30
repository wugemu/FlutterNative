import 'package:flutter/material.dart';

class LogUtil{
  static void showLog(var info){
    debugPrint(DateTime.now().millisecondsSinceEpoch.toString()+":"+info);
  }
}