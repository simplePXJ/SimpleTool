//
//  SKLine_GesturePan.m
//  SimpleTool
//
//  Created by PXJ on 2017/12/6.
//  Copyright © 2017年 com. All rights reserved.
//

#import "SKLine_GesturePan.h"

@implementation SKLine_GesturePan
{
    BOOL loadMoreLocked;//短時間加載過多
    NSInteger recordPanIndex;//记录滑动位置
}
- (instancetype)init{
    self = [super init];
    if (self) {
        loadMoreLocked = NO;
        recordPanIndex = -1;
    }
    return self;
}

- (void)addGesturePan{
    UIPanGestureRecognizer * panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGes:)];
    panGes.maximumNumberOfTouches = 1;
    [_candleView addGestureRecognizer:panGes];
}
- (void)panGes:(UIPanGestureRecognizer *)panGes{
    if (panGes.state == UIGestureRecognizerStateBegan) {
        if (_datamanager.currentIndex<0) {
            _datamanager.currentIndex = _datamanager.allDataArray.count-1-_datamanager.allDataArray.count-Control_Get_DefaultShowCandleNum/4*3;
            recordPanIndex = _datamanager.currentIndex;
        }
    }
    
    CGPoint point = [panGes translationInView:_candleView];
    CGPoint currentPoint = [panGes locationInView:_candleView];
    if (currentPoint.x >CGRectGetWidth(_candleView.frame) ||
        currentPoint.x<0 ||
        currentPoint.y>CGRectGetHeight(_candleView.frame)||
        currentPoint.y<0) {
        [self endPanGes];
        return;
    }
    [self panTrigger:point.x];
    
    if (panGes.state == UIGestureRecognizerStateEnded||
        panGes.state == UIGestureRecognizerStateCancelled||
        panGes.state == UIGestureRecognizerStateFailed) {
        [self endPanGes];
    }
}

- (void)panTrigger:(float)moveX{
    CGFloat candleWidth = CGRectGetWidth(_candleView.frame)/Control_Get_DefaultShowCandleNum;
    NSInteger moveCount = fabs(moveX)/candleWidth;
    if (moveX>0) {
        recordPanIndex = _datamanager.currentIndex-moveCount;
    }else if(moveX<0){
        recordPanIndex = _datamanager.currentIndex+moveCount;
    }else{
        return;
    }
    
    recordPanIndex <0?(recordPanIndex=0):YES;
    if ([self.delegate respondsToSelector:@selector(panGesWithMove)]) {
        if(recordPanIndex <_datamanager.allDataArray.count -Control_Get_DefaultShowCandleNum/4*3 &&_datamanager.allDataArray.count>=Control_Get_DefaultShowCandleNum/4*3){
            _datamanager.currentQueenElementArray = [NSMutableArray arrayWithCapacity:0];
            NSInteger  maxForCount = _datamanager.allDataArray.count;
            if (recordPanIndex + Control_Get_DefaultShowCandleNum<_datamanager.allDataArray.count) {
                maxForCount = recordPanIndex+ Control_Get_DefaultShowCandleNum;
            }
            for (NSInteger i = recordPanIndex; i<maxForCount; i++) {
                [_datamanager.currentQueenElementArray addObject:_datamanager.allDataArray[i]];
            }
        }
        [self.delegate panGesWithMove];
    }
    
    if (recordPanIndex <= 50 && loadMoreLocked == NO) {
        loadMoreLocked = YES;
        [_datamanager getKLineBeforeDataSelector];
        [self performSelector:@selector(unLockLoadMore) withObject:nil afterDelay:1];
    }
}
- (void)setRecordPanIndex:(NSInteger)sRecordPanIndex{
    if (recordPanIndex<0) {
        recordPanIndex = sRecordPanIndex;
    }
}
- (void)endPanGes{
    _datamanager.currentIndex = recordPanIndex;
    if (_datamanager.currentIndex >= _datamanager.allDataArray.count - Control_Get_DefaultShowCandleNum / 4 * 3 || _datamanager.currentIndex < 0) {//已到最大数据时，继续滑出现的问题
        _datamanager.currentIndex = _datamanager.allDataArray.count - 1 - Control_Get_DefaultShowCandleNum / 4 * 3;
        
        if (_datamanager.currentIndex < 0) {
            _datamanager.currentIndex = 0;
        }
        recordPanIndex = _datamanager.currentIndex;
    }
    
    if (_datamanager.allDataArray.count < Control_Get_DefaultShowCandleNum / 4 * 3) {
        _datamanager.currentIndex = 0;
        recordPanIndex = _datamanager.currentIndex;
    }
}

- (void)unLockLoadMore{
    loadMoreLocked = NO;
}
@end
