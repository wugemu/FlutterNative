package com.lang.andlang2.model;

import com.example.test.andlang.andlangutil.BaseLangActivity;
import com.example.test.andlang.andlangutil.BaseLangPresenter;
import com.example.test.andlang.andlangutil.BaseLangViewModel;
import com.example.test.andlang.andlangutil.LangHttpInterface;
import com.example.test.andlang.util.BaseLangUtil;
import com.lang.andlang2.util.BaseHttpUtil;
import com.lang.andlang2.util.Constants;

import java.util.HashMap;
import java.util.Map;

public class MainModel extends BaseLangViewModel{
    public String result;
    public MainModel(BaseLangActivity activity, BaseLangPresenter presenter) {
        super(activity, presenter);
    }

    public void reqVersion(final String tag){
        //网络请求
        Map<String, Object> param = new HashMap<String, Object>();
        BaseHttpUtil.getHttp(activity, Constants.GET_VERSION, param, String.class, new LangHttpInterface<String>() {
            @Override
            public void success(String response) {
                BaseLangUtil.isMainThread("reqVersion::success");
                result=response;
                presenter.notifyView(tag);
            }

            @Override
            public void empty() {

            }

            @Override
            public void error() {

            }

            @Override
            public void fail() {
            }
        });
    }
}
