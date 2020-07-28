package com.example.test.langpush;

import android.app.ActivityManager;
import android.app.Application;
import android.content.Context;
import android.os.Process;
import android.util.Log;

import com.example.test.langpush.util.SystemUtil;
import com.huawei.android.hms.agent.HMSAgent;
import com.meizu.cloud.pushsdk.util.MzSystemUtils;
import com.xiaomi.channel.commonutils.logger.LoggerInterface;
import com.xiaomi.mipush.sdk.Logger;
import com.xiaomi.mipush.sdk.MiPushClient;

import java.util.List;

//需要打开应用推送权限
public class LangPushApp extends Application {
    //小米推送参数配置
    public static final String XIAOMI_APP_ID = "2882303761517900729";
    public static final String XIAOMI_APP_KEY = "5521790093729";
    //魅族推送参数配置
    public static final String MEIZU_APP_ID = "117180";
    public static final String MEIZU_APP_KEY = "929c20e1813f42a7af29c490c133826e";
    //OPPO推送参数配置
    public static final String OPPO_APP_AppKey = "e4b873800e744cae9e685a2f552e1012";
    public static final String OPPO_APP_AppSecret = "69a42a0800444e2c81404e127e9d5495";

    @Override
    public void onCreate() {
        super.onCreate();

        //华为推送初始化
        if(SystemUtil.isHuawei()) {
            HMSAgent.init(this);
        }

        //小米推送初始化
        if(SystemUtil.isXiaomi()) {
            if (shouldInit()) {
                reInitXiaoMiPush(this);
            }
            //小米推送日志
            LoggerInterface newLogger = new LoggerInterface() {
                @Override
                public void setTag(String tag) {
                    // ignore
                }

                @Override
                public void log(String content, Throwable t) {
                    Log.d("0.0", content, t);
                }

                @Override
                public void log(String content) {
                    Log.d("0.0", content);
                }
            };
            Logger.setLogger(this, newLogger);
        }

        //魅族推送初始化
        if(MzSystemUtils.isBrandMeizu(this)){
            reInitMeiZuPush(this);
        }
    }

    //因为推送服务XMPushService在AndroidManifest.xml中设置为运行在另外一个进程，这导致本Application会被实例化两次，所以我们需要让应用的主进程初始化。
    private boolean shouldInit() {
        ActivityManager am = ((ActivityManager) getSystemService(Context.ACTIVITY_SERVICE));
        List<ActivityManager.RunningAppProcessInfo> processInfos = am.getRunningAppProcesses();
        String mainProcessName = getPackageName();
        int myPid = Process.myPid();
        for (ActivityManager.RunningAppProcessInfo info : processInfos) {
            if (info.pid == myPid && mainProcessName.equals(info.processName)) {
                return true;
            }
        }
        return false;
    }

    //小米推送
    public static void reInitXiaoMiPush(Context ctx) {
        MiPushClient.registerPush(ctx.getApplicationContext(), XIAOMI_APP_ID, XIAOMI_APP_KEY);
    }

    //魅族推送
    public static void reInitMeiZuPush(Context ctx) {
        com.meizu.cloud.pushsdk.PushManager.register(ctx, MEIZU_APP_ID, MEIZU_APP_KEY);
    }

    //OPPO注册
    public static void reInitOppoPush(Context ctx){
        com.coloros.mcssdk.PushManager.getInstance().register(ctx,OPPO_APP_AppKey,OPPO_APP_AppSecret,new OPPOPushCallback());
    }
}
