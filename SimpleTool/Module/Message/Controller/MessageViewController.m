//
//  MessageViewController.m
//  SimpleTool
//
//  Created by PXJ on 2017/10/12.
//  Copyright © 2017年 com. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageTableView.h"
#import "MessageHeaderView.h"


@interface MessageViewController ()<UIScrollViewDelegate>
{

}
@property (nonatomic,strong)UIScrollView        * verticalScrollview;
@property (nonatomic,strong)UIView              * scrollHeaderView;
@property (nonatomic,strong)UIScrollView        * horizontalScrollview;
@property (nonatomic,strong)MessageTableView    * sysMessageTableView;
@property (nonatomic,strong)MessageTableView    * mineMessageTableView;
@property (nonatomic,strong)UISegmentedControl  * segmentedControl;
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = KColor.backGround;
    [self initNav];
    [self initUI];
}
- (void)initNav{
    NavView * navView = [[NavView alloc] initWithSupView:self.view];
    [self.view addSubview:navView];
    [navView setTitle:@"Message"];
    [navView loadUI];
    
}
#pragma mark - ------------UI界面初始化-------------
- (void)initUI{
    _verticalScrollview             = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeight-64-49)];
    _verticalScrollview.delegate    = self;
    _verticalScrollview.bounces     = NO;
    _verticalScrollview.contentSize = CGSizeMake(KScreenWidth, KScreenHeight-64-49+170);
    [self.view addSubview:_verticalScrollview];
    
    _scrollHeaderView               = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 200)];
    
    _horizontalScrollview               = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_scrollHeaderView.frame), KScreenWidth, KScreenHeight-64-49-30)];
    _horizontalScrollview.delegate      = self;
    _horizontalScrollview.bounces       = NO;
    _horizontalScrollview.contentSize   = CGSizeMake(KScreenWidth*2, CGRectGetHeight(_horizontalScrollview.frame));
    _horizontalScrollview.pagingEnabled = YES;
    _horizontalScrollview.scrollEnabled = NO;
    [_verticalScrollview addSubview:_horizontalScrollview];
    [_verticalScrollview addSubview:_scrollHeaderView];

    [self initScrollHeaderView];
    [self initHorizontalScrollView];
}
- (void)initScrollHeaderView{
    _scrollHeaderView.backgroundColor = KColor.backGround;
    _segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"系统",@"我的"]];
    _segmentedControl.frame = CGRectMake(0, 0, 200, 30);
    _segmentedControl.tintColor = KColor.navBarBack;
    _segmentedControl.center = CGPointMake(KScreenWidth/2.0, 200-15);
    [_segmentedControl addTarget:self action:@selector(segmentControlChange:) forControlEvents:UIControlEventValueChanged];
    [_scrollHeaderView addSubview:_segmentedControl];
    _segmentedControl.selectedSegmentIndex = 0;
}
- (void)initHorizontalScrollView{
    
    __weak typeof(self) weakSelf = self;
    _sysMessageTableView =  [[MessageTableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth,CGRectGetHeight(_horizontalScrollview.frame)) messageStyle:MessageTableViewStyleSystem];
    _sysMessageTableView.tableViewScrollTopBlock = ^(BOOL isTop) {
        if (isTop&&_segmentedControl.selectedSegmentIndex==0) {
            weakSelf.verticalScrollview.scrollEnabled = YES;
        }
    };
    _sysMessageTableView.backgroundColor = [UIColor lightGrayColor];
    [_horizontalScrollview addSubview:_sysMessageTableView];
    
    _mineMessageTableView =  [[MessageTableView alloc] initWithFrame:CGRectMake(KScreenWidth, 0, KScreenWidth, CGRectGetHeight(_horizontalScrollview.frame)) messageStyle:MessageTableViewStyleMine];
    _mineMessageTableView.tableViewScrollTopBlock = ^(BOOL isTop) {
        if (isTop&&_segmentedControl.selectedSegmentIndex==1) {
            weakSelf.verticalScrollview.scrollEnabled = YES;
        }
    };
    _mineMessageTableView.backgroundColor = [UIColor grayColor];
    [_horizontalScrollview addSubview:_mineMessageTableView];
}

#pragma mark  - ------------click响应方法-------------
- (void)segmentControlChange:(UISegmentedControl *)segmented
{
    NSInteger selectIndex = segmented.selectedSegmentIndex;
    
    CGPoint offsetCenter = _horizontalScrollview.contentOffset;
    _horizontalScrollview.contentOffset = CGPointMake(KScreenWidth*selectIndex, offsetCenter.y);
    [self scrollViewDidScroll:_verticalScrollview];
}

#pragma mark - ------------ UIScrollView Delegate -------------
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGSize contentSize ;
    _mineMessageTableView.tableView.contentOffset = CGPointMake(0,0);
    _sysMessageTableView.tableView.contentOffset = CGPointMake(0,0);
    if(_segmentedControl.selectedSegmentIndex ==0){
        contentSize = _sysMessageTableView.tableView.contentSize;
        _sysMessageTableView.frame = CGRectMake(0, 0, KScreenWidth, contentSize.height);
        _sysMessageTableView.tableView.frame = CGRectMake(0, 0, KScreenWidth, contentSize.height);
    }else{
        contentSize = _mineMessageTableView.tableView.contentSize;
        _mineMessageTableView.frame = CGRectMake(KScreenWidth, 0, KScreenWidth, contentSize.height);
        _mineMessageTableView.tableView.frame = CGRectMake(0, 0, KScreenWidth, contentSize.height);
    }
    _horizontalScrollview.frame = CGRectMake(0, 200, KScreenWidth, contentSize.height);
    _verticalScrollview.contentSize = CGSizeMake(KScreenWidth, 200+contentSize.height);
    
    
    if (_verticalScrollview.contentOffset.y<170) {
        _segmentedControl.center  = CGPointMake(KScreenWidth/2.0, 170+15);
    }else {
        _segmentedControl.center  = CGPointMake(KScreenWidth/2.0, _verticalScrollview.contentOffset.y+15);
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
