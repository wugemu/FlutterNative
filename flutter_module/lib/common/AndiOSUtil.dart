import 'package:flutter/services.dart';
import 'dart:io';
class AndiOSUtil{
  static void exitApp(){
    if(Platform.isAndroid) {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }else {
      exit(0);
    }
  }
}