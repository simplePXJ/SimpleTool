//
//  SKLine_GesturePan.h
//  SimpleTool
//
//  Created by PXJ on 2017/12/6.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SKLine_GesturePanDelegate;

@interface SKLine_GesturePan : NSObject

@property (nonatomic,weak)id  <SKLine_GesturePanDelegate>delegate;
@property (nonatomic,strong)UIView * candleView;
@property (nonatomic,strong)SKLine_DataManager * datamanager;

- (void)addGesturePan;
- (void)setRecordPanIndex:(NSInteger)sRecordPanIndex;
- (void)unLockLoadMore;

@end

@protocol SKLine_GesturePanDelegate<NSObject>

- (void)panGesWithMove;

@end
