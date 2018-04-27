//
//  HomeViewController.m
//  SimpleTool
//
//  Created by PXJ on 2017/10/12.
//  Copyright © 2017年 com. All rights reserved.
//

#import "HomeViewController.h"
#import "SKLineViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self initUI];
}
#pragma mark - iniUI
- (void)initUI{
    WS(ws);
    [self setTitle:@"Home"];
//    NavView * navView = [[NavView alloc] initWithSupView:self.view];
//    [self.view addSubview:navView];
//    [navView loadUI];
//    [navView setTitle:@"Home"];
    
    
    self.view.backgroundColor = KColor.backGround;
    AdScrollView * adScrollView = [[AdScrollView alloc] initWithFrame:CGRectMake(0, KNavHeight+5, KScreenWidth, 25)];
    adScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:adScrollView];
    
    [adScrollView setAdArray:@[@"0",@"1",@"2",@"3",@"4",@"5"]];
    
    [adScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(self.navigationController.navigationBar.frame.size.height));
        make.right.equalTo(ws.view.mas_right);
        make.top.equalTo(@(KNavHeight));
        make.height.equalTo(@25);
    }];
    
    UIButton * goKlineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:goKlineBtn];
    goKlineBtn.backgroundColor = KColor.view_main_2;
    [goKlineBtn addTarget:self action:@selector(goKlinePage) forControlEvents:UIControlEventTouchUpInside];
    
    [goKlineBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(adScrollView.mas_bottom);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.bottom.equalTo(ws.view.mas_bottom);
    }];
}

#pragma mark - Click FUNC
- (void)goKlinePage
{
    SKLineViewController * skLinePage = [[SKLineViewController alloc] init];
    [self.navigationController pushViewController:skLinePage animated:YES];
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    
    if (fromInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || fromInterfaceOrientation ==UIInterfaceOrientationLandscapeRight) {
        
    }else{
        
    }

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
