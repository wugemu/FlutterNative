import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ToastUtil{
  static void showToast(BuildContext context,var info){
    Toast.show(info, context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
  }
}