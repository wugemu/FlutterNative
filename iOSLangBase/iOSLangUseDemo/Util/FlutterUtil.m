//
//  FlutterUtil.m
//  iOSLangUseDemo
//
//  Created by jessie on 2020/7/29.
//  Copyright © 2020 lang. All rights reserved.
//

#import "AppDelegate.h"
#import "FlutterUtil.h"
#import <Flutter/Flutter.h>
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>
static NSString *FLUTTER_ENGINE_ID=@"iOSLangFlutter";
@implementation FlutterUtil
//获取url中的key的值
+(void)initFlutter{
    ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine= [[FlutterEngine alloc] initWithName:FLUTTER_ENGINE_ID];
    FlutterEngine *flutterEngine =
    ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
    // Runs the default Dart entrypoint with a default Flutter route.
    [[flutterEngine navigationChannel] invokeMethod:@"setInitialRoute"arguments:@"/"];
    [flutterEngine run];
    // Used to connect plugins (only if you have plugins with iOS platform code).
     [GeneratedPluginRegistrant registerWithRegistry:flutterEngine];
}

+(void)pushFlutterVC:(UIViewController *)vc withRoute:(NSString *)route{
    FlutterViewController *flutterViewController =nil;
    if(![LangUtil isEmpty:route]){
        //设置flutter 路由
        flutterViewController=[[FlutterViewController alloc]init];
        [flutterViewController setInitialRoute:route];
        [GeneratedPluginRegistrant registerWithRegistry:[flutterViewController pluginRegistry]];
    }else{
        FlutterEngine *flutterEngine =
        ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
        flutterViewController =
        [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    }
    //导航控制器入栈的方式切换页面
     [vc.navigationController pushViewController:flutterViewController animated:YES];
    //模态切换的方式切换页面
    //[vc presentViewController:flutterViewController animated:YES completion:nil];
}
@end

