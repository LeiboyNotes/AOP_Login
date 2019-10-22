package com.zl.login;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;

import com.zl.login.annotation.ClickBehavior;
import com.zl.login.annotation.LoginCheck;

public class MainActivity extends AppCompatActivity {

    private final static String TAG = "zl >>>>";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    //用户行为统计
    @ClickBehavior("登陆")
    @LoginCheck
    public void login(View view) {
        Log.e(TAG,"模拟接口请求....通过验证，登陆成功！");
    }
    //用户行为统计
    @ClickBehavior("我的专区")
    @LoginCheck
    public void area(View view) {
        Log.e(TAG,"开始跳转到 -> 我的专区 Activity");
        startActivity(new Intent(this,OtherActivity.class));
    }
    //用户行为统计
    @ClickBehavior("我的优惠券")
    @LoginCheck
    public void coupon(View view) {
        Log.e(TAG,"开始跳转到 -> 我的优惠券 Activity");
        startActivity(new Intent(this,OtherActivity.class));
    }
    //用户行为统计
    @ClickBehavior("我的积分")
    @LoginCheck
    public void score(View view) {
        Log.e(TAG,"开始跳转到 -> 我的积分 Activity");
        startActivity(new Intent(this,OtherActivity.class));
    }
}
