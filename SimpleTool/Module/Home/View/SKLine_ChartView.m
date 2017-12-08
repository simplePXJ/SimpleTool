//
//  SKLine_ChartVIew.m
//  SimpleTool
//
//  Created by PXJ on 2017/12/5.
//  Copyright © 2017年 com. All rights reserved.
//

#import "SKLine_ChartView.h"
#import "SKLine_CandleView.h"

@implementation SKLine_ChartView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
        [self initData];
    }
    return self;
}

#pragma mark - initUI
- (void)initUI{
    WS(ws);
    self.backgroundColor = KColor.backGround;
    _candleView = [[SKLine_CandleView alloc] init];
    [self addSubview:_candleView];
    
    [_candleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(10);
        make.left.equalTo(ws.mas_left).offset(10);
        make.right.equalTo(ws.mas_right).offset(-10);
        make.bottom.equalTo(ws.mas_centerY);
    }];
}

#pragma mark - data
- (void)initData{
    
    _dataManager = [[SKLine_DataManager alloc] init];
    _dataManager.candleView = _candleView;
    _dataManager.delegate = self;
    
    
    _gesManager = [[SKLine_GesManager alloc] init];
    _gesManager.candleView = _candleView;
    _gesManager.delegate = self;
    _gesManager.dataManager = self.dataManager;
    [_gesManager addGesturePan];
}


#pragma mark - click

#pragma mark - SKLine_DataManageDelegate

- (void)dataManageWithDataArray:(NSMutableArray *)dataArray
{
    [_candleView setCandleArray:dataArray];
    
}
- (void)dataManageWithIndexFind:(NSInteger)index
{
    [_gesManager setRecordPanIndex:index];
}
- (void)dataManageWithResponse
{
    [_gesManager unLockLoadMore];
}
#pragma mark - SKLine_GesManagerDelegate
- (void)gesManagerWithMove
{
    [_dataManager onlyMove];
}

@end
