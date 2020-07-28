package com.lang.andlang2.util;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.Application;
import android.content.Context;
import android.os.Handler;
import android.os.Process;
import android.util.Log;

import com.example.test.andlang.util.BaseLangUtil;
import com.example.test.andlang.util.MMKVUtil;
import com.example.test.langpush.LangPushApp;
import com.example.test.langpush.util.SystemUtil;
import com.huawei.android.hms.agent.HMSAgent;
import com.huawei.android.hms.agent.common.handler.ConnectHandler;
import com.huawei.android.hms.agent.push.handler.GetPushStateHandler;
import com.huawei.android.hms.agent.push.handler.GetTokenHandler;
import com.meizu.cloud.pushsdk.util.MzSystemUtils;
import com.xiaomi.channel.commonutils.logger.LoggerInterface;
import com.xiaomi.mipush.sdk.Logger;

import java.util.List;

public class PushUtil {
    public static final String DEVICE_CHANNELID="PHSH_CHANNELID";
    public static final String DEVICE_BRAND="PUHS_BRAND";
    public static final String DEVICE_BRAND_HUAWEI="huawei";
    public static final String DEVICE_BRAND_XIAOMI="xiaomi";
    public static final String DEVICE_BRAND_MEIZU="meizu";
    public static final String DEVICE_BRAND_OPPO="oppo";
    public static final String DEVICE_BRAND_OTHERS="others";

    public static void initPush(final Application context){
        //华为推送初始化 key在AndroidManifest.xml
        if(SystemUtil.isHuawei()) {
            HMSAgent.init(context);
        }

        //小米推送初始化
        if(SystemUtil.isXiaomi()) {
            if (shouldInit(context)) {
                new Handler().postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        LangPushApp.reInitXiaoMiPush(context);
                    }
                },1000);
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
            Logger.setLogger(context, newLogger);
        }

        //魅族推送初始化
        if(MzSystemUtils.isBrandMeizu(context)){
            LangPushApp.reInitMeiZuPush(context);
        }

        //OPPO推送初始化
        if(com.coloros.mcssdk.PushManager.isSupportPush(context)){
            //支持OPPO推送
            LangPushApp.reInitOppoPush(context);
        }
    }

    public static void HuaWeiConnect(Activity activity){
        if(SystemUtil.isHuawei()) {
            //链接华为推送服务
            HMSAgent.connect(activity, new ConnectHandler() {
                @Override
                public void onConnect(int rst) {
                }
            });
            //获取华为推送token
            HMSAgent.Push.getToken(new GetTokenHandler() {
                @Override
                public void onResult(int rst) {
                }
            });
            //获取华为推送状态
            HMSAgent.Push.getPushState(new GetPushStateHandler() {
                @Override
                public void onResult(int rst) {
                }
            });
        }
    }

    //更新推送id
    public static void updateChannelId(Context context, String pushId,String brand){
        if (BaseLangUtil.isAlive(context,Constants.PACKNAME)&&!BaseLangUtil.isEmpty(pushId)){
            if(SystemUtil.isHuawei()){
                //华为机型
                if(!DEVICE_BRAND_HUAWEI.equals(brand)){
                    //不是华为的token
                    return;
                }
            }
            if(SystemUtil.isXiaomi()){
                //小米机型
                if(!DEVICE_BRAND_XIAOMI.equals(brand)){
                    //不是小米的token
                    return;
                }
            }
            if(MzSystemUtils.isBrandMeizu(context)){
                //魅族机型
                if(!DEVICE_BRAND_MEIZU.equals(brand)){
                    //不是魅族的token
                    return;
                }
            }
            if(com.coloros.mcssdk.PushManager.isSupportPush(context)){
                //oppo机型
                if(!DEVICE_BRAND_OPPO.equals(brand)){
                    //不是oppo机型的token
                    return;
                }
            }

            //保存到本地
            MMKVUtil.putString(DEVICE_CHANNELID,pushId);
            MMKVUtil.putString(DEVICE_BRAND,brand);
        }
    }

    //因为推送服务XMPushService在AndroidManifest.xml中设置为运行在另外一个进程，这导致本Application会被实例化两次，所以我们需要让应用的主进程初始化。
    private static boolean shouldInit(Application context) {
        ActivityManager am = ((ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE));
        List<ActivityManager.RunningAppProcessInfo> processInfos = am.getRunningAppProcesses();
        String mainProcessName = context.getPackageName();
        int myPid = Process.myPid();
        if(processInfos!=null) {
            for (ActivityManager.RunningAppProcessInfo info : processInfos) {
                if (info.pid == myPid && mainProcessName.equals(info.processName)) {
                    return true;
                }
            }
        }
        return false;
    }
}
