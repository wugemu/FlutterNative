package com.lang.andlang2;

import android.content.Intent;
import androidx.databinding.DataBindingUtil;
import android.widget.TextView;

import com.example.test.andlang.andlangutil.BaseLangActivity;
import com.example.test.andlang.util.ActivityUtil;
import com.example.test.andlang.util.BaseLangUtil;
import com.example.test.andlang.util.ToastUtil;
import com.lang.andlang2.persenter.MainPersenter;
import com.lang.andlang2.util.Constants;

import butterknife.BindView;
import butterknife.OnClick;

public class MainActivity extends BaseLangActivity<MainPersenter> {
    @BindView(R.id.tv_text_value)
    TextView tv_text_value;
    @Override
    public void notifyView(String tag) {
        if(Constants.GET_VERSION.equals(tag)){
            BaseLangUtil.isMainThread("MainActivity::notifyView");
            ToastUtil.show(MainActivity.this,"请求结果返回");
            tv_text_value.setText("请求结果返回");
        }
    }

    @Override
    public int getLayoutId() {
        return R.layout.activity_main_test;
    }

    @Override
    public void initView() {

        initLoading();
        initTitleBar(true,"新架构");
    }

    @Override
    public void initPresenter() {
        presenter=new MainPersenter(MainActivity.this);
    }

    @Override
    public void initData() {
        showWaitDialog();
        presenter.reqVersion();
    }

    @OnClick(R.id.btn_change)
    public void clickChangeBtn(){
        //修改
        showWaitDialog();
        presenter.reqVersion();
    }

    @OnClick(R.id.btn_jump)
    public void clickJump(){
        //跳转
        Intent intent=new Intent(MainActivity.this,MainActivity.class);
        ActivityUtil.getInstance().start(MainActivity.this,intent);
    }

}
