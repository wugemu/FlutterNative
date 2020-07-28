package com.lang.andlang2.flutil;

import android.app.Activity;
import android.content.Context;

import com.example.test.andlang.util.BaseLangUtil;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.android.FlutterActivityLaunchConfigs;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.embedding.engine.dart.DartExecutor;

public class FlutterUtil {
    public static final String FLUTTER_ENGINE_ID="AndLangFlutter";
    public static void initFlutter(Context context){
        // Instantiate a FlutterEngine.
        FlutterEngine flutterEngine = new FlutterEngine(context);
        // Configure an initial route.
        flutterEngine.getNavigationChannel().setInitialRoute("/");
        // Start executing Dart code to pre-warm the FlutterEngine.
        flutterEngine.getDartExecutor().executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault()
        );
        // Cache the FlutterEngine to be used by FlutterActivity or FlutterFragment.
        FlutterEngineCache
                .getInstance()
                .put(FLUTTER_ENGINE_ID, flutterEngine);
    }
    public static void startFlutterActivity(Activity activity,String route){
        if(!BaseLangUtil.isEmpty(route)){
            FlutterEngineCache
                    .getInstance().get(FLUTTER_ENGINE_ID).getNavigationChannel().setInitialRoute(route);
        }
        activity.startActivity(
                FlutterActivity
                        .withCachedEngine(FLUTTER_ENGINE_ID)
//                        .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.transparent)
                        .build(activity)
        );
    }
}
