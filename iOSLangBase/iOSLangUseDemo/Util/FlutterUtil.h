//
//  FlutterUtil.h
//  iOSLangUseDemo
//
//  Created by jessie on 2020/7/29.
//  Copyright © 2020 lang. All rights reserved.
//

#ifndef FlutterUtil_h
#define FlutterUtil_h

#import <UIKit/UIKit.h>
#endif /* FlutterUtil_h */

@interface FlutterUtil : NSObject

+(void)initFlutter;
+(void)pushFlutterVC:(UIViewController *)vc withRoute:(NSString *)route;

@end
