//
//  ScrollTextViewController.m
//  SimpleTool
//
//  Created by PXJ on 2017/11/29.
//  Copyright © 2017年 com. All rights reserved.
//

#import "ScrollTextViewController.h"

@interface ScrollTextViewController ()

@end

@implementation ScrollTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
}
- (void)initUI{
    NavView * navView = [[NavView alloc] initWithSupView:self.view];
    [self.view addSubview:navView];
    [navView setTitle:@"文字滚动条"];
    [navView loadUI];
    self.view.backgroundColor = KColor.backGround;
    AdScrollView * adScrollView = [[AdScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(navView.frame)+5, KScreenWidth, 25)];
    [self.view addSubview:adScrollView];
    [adScrollView setAdArray:@[@"0",@"1",@"2",@"3",@"4",@"5"]];
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
