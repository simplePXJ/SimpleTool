//
//  SKLineViewController.m
//  SimpleTool
//
//  Created by PXJ on 2017/12/5.
//  Copyright © 2017年 com. All rights reserved.
//

#import "SKLineViewController.h"
#import "SKLine_ChartView.h"

@interface SKLineViewController ()

@property (nonatomic,strong)NavView * navView;
@end

@implementation SKLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNav];
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - initUI
- (void)initNav{
    _navView = [[NavView alloc] init];
    [_navView setTitle:@"Home"];
    [self.view addSubview:_navView];
    
    [_navView.rightControl addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [_navView.rightControl setTitle:@"close" forState:UIControlStateNormal];
}

- (void)initUI{
    WS(ws);
    self.view.backgroundColor = KColor.view_main_2;
    SKLine_ChartView * chartView = [[SKLine_ChartView alloc] init];
    [self.view addSubview:chartView];
    
    [chartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_navView.mas_bottom);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.bottom.equalTo(ws.view.mas_bottom);
    }];
    

}

#pragma mark - click
- (void)close
{
    WS(ws);
    [self dismissViewControllerAnimated:YES completion:^{
        ws.tabBarController.tabBar.hidden = NO;
    }];
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
