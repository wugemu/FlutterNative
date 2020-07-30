import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_module/common/LogUtil.dart';
import 'package:flutter_module/common/Const.dart';
import 'package:flutter_module/model/BaseBean.dart';
import 'dart:convert';
import 'package:flutter_module/common/ToastUtil.dart';
import 'dart:io';
import 'package:flutter_module/common/LangUtil.dart';
import 'package:flutter_module/common/MMKUtil.dart';
import 'dart:async';
import 'dart:typed_data';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class HttpUtil{
  //async 异步
  static Dio _dio;
  static Dio MyDio(){
    if(_dio==null){
      _dio=new Dio();
      _dio.options.contentType= Headers.formUrlEncodedContentType;
    }

    return _dio;
  }
  static Future<BaseBean> getHttp(BuildContext context, String url,Map<String,dynamic> params) async {
    BaseBean baseBean;
    try {
      if(params==null){
        params=new Map();
      }
      if(Platform.isIOS){
        //ios相关代码
        params["from"]="iOS";
      }else if(Platform.isAndroid){
        //android相关代码
        params["from"]="Android";
      }
      LogUtil.showLog("接口请求url:$url");
      LogUtil.showLog("接口请求参数:$params");
      Response response = await new Dio().get(Const.HOST+url,queryParameters: params);
      LogUtil.showLog("接口返回url:$url");
      LogUtil.showLog("接口返回结果:$response.toString()");
      Map baseMap = json.decode(response.toString());
      baseBean=BaseBean.fromJson(baseMap);
      if(baseBean==null){
        baseBean=new BaseBean(status:10000,message:"接口返回的数据是空的",data:"");
      }
      if(baseBean.status!=BaseBean.STATUS_SUCCESS){
        if(!LangUtil.isEmptyStr(baseBean.message)) {
          ToastUtil.showToast(context, baseBean.message);
        }
      }
    } catch (e) {
      LogUtil.showLog(e.toString());
    }
    return baseBean;
  }

  //async 异步
  static Future<BaseBean> postHttp(BuildContext context,String url,Map<String,dynamic> params) async {
    BaseBean baseBean;
    try {
      if(params==null){
        params=new Map();
      }
      if(Platform.isIOS){
        //ios相关代码
        params["from"]="iOS";
      }else if(Platform.isAndroid){
        //android相关代码
        params["from"]="Android";
      }


      String token=await MMKUtil.getString(Const.KEY_COOKIE);
      if(!LangUtil.isEmptyStr(token)){
        LogUtil.showLog("接口请求token:$token");
        MyDio().options.headers["token"]=token;
      }

      LogUtil.showLog("接口请求url:$url");
      LogUtil.showLog("接口请求参数:$params");
      Response response = await MyDio().post(Const.HOST+url,data: params);
      LogUtil.showLog("接口返回url:$url");
      LogUtil.showLog("接口返回结果:$response.toString()");
      Map baseMap = json.decode(response.toString());
      baseBean=BaseBean.fromJson(baseMap);
      if(baseBean==null){
        baseBean=new BaseBean(status:10000,message:"接口返回的数据是空的",data:"");
      }
      if(baseMap!=null&&baseMap.containsKey("access_token")){
        baseBean.status=BaseBean.STATUS_SUCCESS;
        baseBean.data=baseMap["access_token"];
      }
      if(baseBean.status!=BaseBean.STATUS_SUCCESS){
        if(!LangUtil.isEmptyStr(baseBean.message)) {
          ToastUtil.showToast(context, baseBean.message);
        }
      }
    } catch (e) {
      LogUtil.showLog(e.toString());
    }
    return baseBean;
  }

  static Future<Map> getOtherHttp(BuildContext context, String url,Map<String,dynamic> params) async {
    try {
      if(params==null){
        params=new Map();
      }
      if(Platform.isIOS){
        //ios相关代码
        params["from"]="iOS";
      }else if(Platform.isAndroid){
        //android相关代码
        params["from"]="Android";
      }
      LogUtil.showLog("接口请求url:$url");
      LogUtil.showLog("接口请求参数:$params");
      Response response = await new Dio().get(url,queryParameters: params);
      LogUtil.showLog("接口返回url:$url");
      LogUtil.showLog("接口返回结果:$response.toString()");
      Map baseMap = json.decode(response.toString());
      return baseMap;

    } catch (e) {
      LogUtil.showLog(e.toString());
    }
    return null;
  }

  static Future<BaseBean> postUploadFile(BuildContext context, String url,String filePath,Map<String,dynamic> params) async {
    BaseBean baseBean;
    try {
      if(params==null){
        params=new Map();
      }
      if(Platform.isIOS){
        //ios相关代码
        params["from"]="iOS";
      }else if(Platform.isAndroid){
        //android相关代码
        params["from"]="Android";
      }
      var name = filePath.substring(filePath.lastIndexOf("/") + 1, filePath.length);
      params["file"]=await MultipartFile.fromFile(filePath, filename:name);


      String token=await MMKUtil.getString(Const.KEY_COOKIE);
      if(!LangUtil.isEmptyStr(token)){
        LogUtil.showLog("接口请求token:$token");
      }
      Options options = Options(headers: {"token":token});

      FormData formdata = FormData.fromMap(params);
      LogUtil.showLog("接口请求url:$url");
      LogUtil.showLog("接口请求参数:$params");
      Response response = await new Dio().post(Const.HOST+url,data: formdata,options: options);
      LogUtil.showLog("接口返回url:$url");
      LogUtil.showLog("接口返回结果:$response.toString()");
      Map baseMap = json.decode(response.toString());
      baseBean=BaseBean.fromJson(baseMap);
      if(baseBean==null){
        baseBean=new BaseBean(status:10000,message:"接口返回的数据是空的",data:"");
      }
      if(baseMap!=null&&baseMap.containsKey("access_token")){
        baseBean.status=BaseBean.STATUS_SUCCESS;
        baseBean.data=baseMap["access_token"];
      }
      if(baseBean.status!=BaseBean.STATUS_SUCCESS){
        if(!LangUtil.isEmptyStr(baseBean.message)) {
          ToastUtil.showToast(context, baseBean.message);
        }
      }

    } catch (e) {
      LogUtil.showLog(e.toString());
    }
    return baseBean;
  }

  //图片下载
  static Future<String> downloadImg(BuildContext context,String fileUrl) async{
    var response = await MyDio().get(fileUrl, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    LogUtil.showLog(result);
    return result;
  }
  //文件下载
  static Future<String> downloadFile(BuildContext context,String fileUrl) async{
    Directory extDir = await getApplicationDocumentsDirectory();
    if(Platform.isAndroid){
      extDir=await getExternalStorageDirectory();
    }
    String dirPath = '${extDir.path}/GJDownload';//照片存储目录
    String fileName= fileUrl.substring(fileUrl.lastIndexOf('/'));
    if(fileName.contains("?")){
      fileName=fileName.substring(0,fileName.indexOf("?"));
    }
    String savePath=dirPath+fileName;
    await MyDio().download(fileUrl, savePath);
    final result = await ImageGallerySaver.saveFile(savePath);
    LogUtil.showLog(result);
    return result;
  }
}