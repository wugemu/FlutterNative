class Const{
  static const WXAPPID="";
  static const WXSECRET="";

  static const HOST="http://192.168.11.13/app";

  static const H5_HOST="http://192.168.11.13:8080/#/";//测试环境
  //隐私协议和服务政策
  static const HT_YSXY="http://192.168.11.13/#/user/privacy";
  static const HT_FWZC="http://192.168.11.13/#/user/agree";


  static const REQ_TB_HOMEDATE="/taobaoApi/reqHomeData.do";

  //微信access_token授权接口
  static const REQ_WX_ACCESSTOKEN="https://api.weixin.qq.com/sns/oauth2/access_token";

  //发送验证码
  static const REQ_SMSCODE="/api/sms/smscode";
  //用户注册
  static const REQ_REGISTER="/api/user/register";
  //找回密码
  static const REQ_RESETPWD="/api/user/resetpwd";
  //登录
  static const REQ_LOGIN="/login";
  //文件上传
  static const REQ_UPLOAD="/api/upload";
  //人脸比对接口
  static const REQ_CHECK_FACE="/api/face/check";
  //首页启动广告
  static const REQ_AD_HOME="/api/index/findBanners";

  //存储key
  static const KEY_BOOT_FIRST="KEY_BOOT_FIRST";//第一次启动
  static const KEY_LOGIN="KEY_LOGIN";//是否登录
  static const KEY_AGREE_XY="KEY_AGREE_XY";//是否同意协议
  static const KEY_COOKIE="KEY_COOKIE";


}