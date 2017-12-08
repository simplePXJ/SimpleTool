//
//  MineViewController.m
//  SimpleTool
//
//  Created by PXJ on 2017/10/12.
//  Copyright © 2017年 com. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * btn = [QuickUI newButtonWithFrame:CGRectMake(60, 100, 100, 50) bgColor:KColor.view_main title:@"insetNewItem" titleColor:KColor.navTitleText titleFont:KFont.textM];
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(insertNewItem) forControlEvents:UIControlEventTouchUpInside];
}
- (void)insertNewItem
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AddNewTabbarItem" object:nil];
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
