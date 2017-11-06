//
//  AppDelegate+AppSevice.h
//  SimpleTool
//
//  Created by PXJ on 2017/10/12.
//  Copyright © 2017年 com. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (AppSevice)
/**
 初始化窗口
 */
- (void)initWindow;

+(instancetype)sharedAppDelegate;

@end
