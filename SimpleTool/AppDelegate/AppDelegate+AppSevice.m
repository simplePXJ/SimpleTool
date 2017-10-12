//
//  AppDelegate+AppSevice.m
//  SimpleTool
//
//  Created by PXJ on 2017/10/12.
//  Copyright © 2017年 com. All rights reserved.
//

#import "AppDelegate+AppSevice.h"
#import "MainTabBarController.h"

@implementation AppDelegate (AppSevice)

+(instancetype)sharedAppDelegate;
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

#pragma mark ------初始化窗口------
- (void)initWindow
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.mainTabBar = [MainTabBarController new];
    self.window.rootViewController = self.mainTabBar;
}
@end
