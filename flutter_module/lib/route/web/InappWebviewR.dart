import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_module/common/ComImport.dart';
import 'dart:io';

class InappWebviewR extends StatefulWidget {
  const InappWebviewR({Key key, @required this.url}) : super(key: key);
  final String url;
  @override
  _InappWebviewRState createState() => new _InappWebviewRState();
}

class _InappWebviewRState extends State<InappWebviewR> {
  String _webUrl;
  String _title;
  String _cookie;
  InAppWebViewController _webViewController;

  @override
  void initState() {
    _webUrl = widget.url;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initUrlTitle() {
    var args = ModalRoute
        .of(context)
        .settings
        .arguments;
    if (args != null) {
      _webUrl = args;
    }
    if(LangUtil.isEmptyStr(_webUrl)){
      _webUrl="https://www.baidu.com";
    }
    _title = LangUtil.getUrlParma(_webUrl, "title");
    if (!_webUrl.contains("from=")) {
      if (_webUrl.contains("?")) {
        _webUrl = _webUrl + "&from=${Platform.isAndroid ? "Android" : "iOS"}";
      }
    }
    String changeDeviceOri = LangUtil.getUrlParma(
        _webUrl, "changeDeviceOrientation");
    if ("1" == changeDeviceOri) {
      //修改屏幕横屏显示
      LangUtil.changeDeviceRight();
    } else {
      LangUtil.changeDeviceUp();
    }
    LogUtil.showLog("当前加载的web url == $_webUrl");
  }

  @override
  Widget build(BuildContext context) {
    initUrlTitle();
    return Scaffold(
      body: SafeArea(//设置安全区域 ，不沉浸式
          top: true,
          child:Builder(builder: (BuildContext context) {
            return InAppWebView(
              initialUrl: _webUrl,
              initialHeaders: {
                "token": _cookie,
              },
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  debuggingEnabled: false,
                ),
                ios: IOSInAppWebViewOptions(
                  allowsInlineMediaPlayback: true, //允许h5内视频播放
                ),
              ),

              onWebViewCreated: (InAppWebViewController controller) {
                _webViewController = controller;

                //H5端调用获取token方法
//        window.flutter_inappbrowser.callHandler('GetToken').then(function(result) {
//          console.log(result);
//        });

                _webViewController.addJavaScriptHandler(
                    handlerName: "GetToken", callback: (args) {
                  LogUtil.showLog("收到来自web的消息" + args.toString());
                  return _cookie;
                });
              },
              onLoadStart: (InAppWebViewController controller, String url) {

              },
              onLoadStop: (InAppWebViewController controller, String url) async {

              },
              onProgressChanged: (InAppWebViewController controller, int progress) {

              },
            );
          },)
      ),
    );
  }

  void initCookie() async {
    _cookie = await MMKUtil.getString(Const.KEY_COOKIE);
    LogUtil.showLog(_cookie);
  }
}