package com.lang.andlang2.persenter;

import androidx.databinding.ViewDataBinding;

import com.example.test.andlang.andlangutil.BaseLangActivity;
import com.example.test.andlang.andlangutil.BaseLangPresenter;
import com.example.test.andlang.util.BaseLangUtil;
import com.lang.andlang2.model.MainModel;
import com.lang.andlang2.util.Constants;

public class MainPersenter extends BaseLangPresenter{
    private  MainModel mainModel;

    public MainPersenter(BaseLangActivity activity) {
        super(activity);
    }

    @Override
    public void initModel() {
        mainModel=new MainModel(activity,this);
    }

    public void reqVersion(){
        mainModel.reqVersion(Constants.GET_VERSION);
    }

    @Override
    public void notifyView(String tag) {
//        if(Constants.GET_VERSION.equals(tag)){
//            ToastUtil.show(activity,"MainPersenter请求结果返回");
//        }
        BaseLangUtil.isMainThread("MainPersenter::notifyView");
        super.notifyView(tag);
    }
}
