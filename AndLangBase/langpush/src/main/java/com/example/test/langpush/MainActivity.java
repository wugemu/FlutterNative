package com.example.test.langpush;

import android.content.Intent;
import android.net.Uri;
import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;

import com.huawei.android.hms.agent.HMSAgent;
import com.huawei.android.hms.agent.common.handler.ConnectHandler;
import com.huawei.android.hms.agent.push.handler.GetTokenHandler;

@Deprecated
public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //链接华为推送服务
        HMSAgent.connect(this, new ConnectHandler() {
            @Override
            public void onConnect(int rst) {
                Log.d("0.0","HMS connect end:" + rst);
            }
        });
        //获取华为推送token
        getHWToken();

        //通知跳转
        Intent intent = getIntent();
        if (intent != null) {
            Uri uri = intent.getData();
            if (uri != null) {
                String dataString = intent.getDataString();
                Log.d("0.0",dataString);
                intent=new Intent(MainActivity.this,Main2Activity.class);
                startActivity(intent);
            }
        }
    }

    /**
     * 获取token
     */
    private void getHWToken() {
        Log.d("0.0","get token: begin");
        HMSAgent.Push.getToken(new GetTokenHandler() {
            @Override
            public void onResult(int rst) {
                Log.d("0.0","get token: end " + rst);
            }
        });
    }
}
