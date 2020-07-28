package com.lang.andlang2;

import com.example.test.andlang.andlangutil.BaseLangApplication;
import com.example.test.andlang.http.HttpConfig;
import com.example.test.andlang.util.MMKVUtil;
import com.lang.andlang2.util.PushUtil;
import com.umeng.analytics.MobclickAgent;
import com.umeng.commonsdk.UMConfigure;

public class AndLangApp extends BaseLangApplication {
    @Override
    public void onCreate() {
        super.onCreate();
        initData();
    }

    public void initData() {

        //检测是否内存溢出
        initLeakCanry();

        //MMKV SharePreference 数据迁移
        //未使用SharePreference无须使用数据迁移
        //使用SharePreference须数据迁移 否则之前保存的数据不能同步
//        MMKVUtil.changeMMKV(this);

        //引用远程基础库
        //Glide图片加载工具初始化
        initImageLoad();

         /*奔溃日志存储本地功能初始化
          dirPath 日志记录路径
        */
        initCrashLog("/andlang/crash/");

        //安装防崩溃功能
//        installCockroach();//最大化防止应用crash  需要在清单中注册DebugSafeModeTipActivity

        //图片临时存储文件夹名称
        initCacheName("andlang");

        //网络配置初始化
        HttpConfig.tmpImageDir="andlang";//配置文件下载sd文件夹，默认nyso
        HttpConfig.imgUpDefName="pic";//图片文件上传接口后台定义的接收文件的参数名称，由后台提供，默认pic
        HttpConfig.cookieName="JSSIONID";//有效的cookie名称，用户登录标识，由后台提供，默认JSSIONID

        //401 未登录状态
        HttpConfig.addCodeConfig(401,"未登录状态");

        //友盟统计
        UMConfigure.init(this, UMConfigure.DEVICE_TYPE_PHONE, null);
        MobclickAgent.setScenarioType(this, MobclickAgent.EScenarioType.E_UM_NORMAL);

        /** 设置是否对日志信息进行加密, 默认false(不加密). */
        MobclickAgent.enableEncrypt(true);
        MobclickAgent.setCatchUncaughtExceptions(false);//关闭友盟默认错误统计 使用自定义统计上传错误

        //推送初始化
        PushUtil.initPush(this);

        //app 后台前台 切换监听
        initBackgroundCallBack();

    }
}
