package com.a94xsm.demo_flutter_live;

import android.os.Build;
import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            // 状态栏沉浸
            getWindow().setStatusBarColor(0);
        }
        GeneratedPluginRegistrant.registerWith(this);

    }
}
