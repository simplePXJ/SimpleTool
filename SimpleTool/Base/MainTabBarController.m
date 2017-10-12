//
//  MainTabBarController.m
//  SimpleTool
//
//  Created by PXJ on 2017/10/12.
//  Copyright © 2017年 com. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"

@interface MainTabBarController ()
{
    NSArray * _tabbar_nameArray;
    NSArray * _tabbar_select_ImageArray;
    NSArray * _tabbar_ImageArray;
    
}
@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    [self initTabbarItem];
    
}
- (void)initData{
    _tabbar_nameArray = @[@"首页",@"消息",@"我的"];
    _tabbar_select_ImageArray = @[@"tabbar_main_select",@"tabbar_message_select",@"tabbar_mine_select"];
    _tabbar_ImageArray = @[@"tabbar_main",@"tabbar_message",@"tabbar_mine"];
}
- (void)initTabbarItem
{
    HomeViewController * homeVC = [[HomeViewController alloc] init];
    UINavigationController * homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeNav.navigationBarHidden = YES;
    
    MessageViewController * messageVC = [[MessageViewController alloc] init];
    UINavigationController * messageNav = [[UINavigationController alloc] initWithRootViewController:messageVC];
    messageNav.navigationBarHidden = YES;

    MineViewController * mineVC = [[MineViewController alloc] init];
    UINavigationController * mineNav = [[UINavigationController alloc] initWithRootViewController:mineVC];
    mineNav.navigationBarHidden = YES;

    [self setViewControllers:@[homeNav,messageNav,mineNav]];
    self.tabBar.backgroundColor = [UIColor grayColor];
    for (int i = 0 ; i<_tabbar_select_ImageArray.count; i++) {
        UITabBarItem * tabbarItem =(UITabBarItem *)[self.tabBar.items objectAtIndex:i];
        
        NSString * tabbarName       = _tabbar_nameArray[i];
        NSString * selectImage      = _tabbar_select_ImageArray[i];
        NSString * unselectImage    = _tabbar_ImageArray[i];
        
        NSDictionary *selectdeAttrubributeDic   = @{NSFontAttributeName: [UIFont systemFontOfSize:11.0f],
                                                  NSForegroundColorAttributeName:[UIColor redColor]};
        NSDictionary *unSelectedAttrubributeDic = @{NSFontAttributeName: [UIFont systemFontOfSize:11.0f],
                                                    NSForegroundColorAttributeName:[UIColor blackColor]};
        [tabbarItem setTitle:tabbarName];
        tabbarItem.image = [IMAGE_NAMED(unselectImage) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        tabbarItem.selectedImage = [IMAGE_NAMED(selectImage) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [tabbarItem setTitleTextAttributes:selectdeAttrubributeDic forState:UIControlStateSelected];
        [tabbarItem setTitleTextAttributes:unSelectedAttrubributeDic forState:UIControlStateNormal];

    }
    self.tabBarController.selectedIndex = 0;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end