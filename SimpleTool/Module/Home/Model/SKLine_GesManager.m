//
//  SKLine_GesManager.m
//  SimpleTool
//
//  Created by PXJ on 2017/12/6.
//  Copyright © 2017年 com. All rights reserved.
//

#import "SKLine_GesManager.h"

@implementation SKLine_GesManager

- (instancetype)init
{
    self = [super init];
    if (self) {
    
    }
    return self;
}
- (void)addGesturePan;
{
    _gesturePan = [[SKLine_GesturePan alloc] init];
    _gesturePan.candleView = self.candleView;
    _gesturePan.datamanager = self.dataManager;
    _gesturePan.delegate = self;
    [_gesturePan addGesturePan];
}
- (void)setRecordPanIndex:(NSInteger)sRecordPanIndex{
    [_gesturePan setRecordPanIndex:sRecordPanIndex];
}

-(void)unLockLoadMore{
    [_gesturePan unLockLoadMore];
}

#pragma mark - SKLine_GesturePanDelegate
- (void)panGesWithMove
{
    if ([self.delegate respondsToSelector:@selector(gesManagerWithMove)]) {
        [self.delegate gesManagerWithMove];
    }
    
}
@end
