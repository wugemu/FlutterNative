package com.example.test.andlang.andlangutil;

import androidx.databinding.ViewDataBinding;
import android.util.Log;

import com.example.test.andlang.util.LogUtil;

/**
 * Created by root on 18-3-8.
 */

public abstract class BaseLangPresenter {
    public static String TAG=BaseLangApplication.TAG;
    public BaseLangActivity activity;
    public BaseLangFragment fragment;
    public BaseLangPresenter(BaseLangActivity activity){
        try {
            this.activity=activity;
        }catch (Exception e){
            Log.d("0.0",e.getMessage());
        }
        initModel();
    }
    public BaseLangPresenter(BaseLangFragment fragment,BaseLangActivity activity){
        try {
            this.activity=activity;
            this.fragment=fragment;
        }catch (Exception e){
            Log.d("0.0",e.getMessage());
        }
        initModel();
    }

    public abstract void initModel();

    public void notifyView(final String tag){
        if(activity!=null) {
            activity.runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    if(fragment!=null){
                        fragment.notifyView(tag);
                    }else if(activity!=null){
                        activity.notifyView(tag);
                    }else {
                        LogUtil.e("0.0","error:请求回调失败！！！");
                    }
                }
            });
        }
    }
}
