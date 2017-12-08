//
//  SKLine_GesManager.h
//  SimpleTool
//
//  Created by PXJ on 2017/12/6.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SKLine_GesturePan.h"

@protocol SKLine_GesManagerDelegate;

@interface SKLine_GesManager : NSObject<SKLine_GesturePanDelegate>

@property (nonatomic,weak)id <SKLine_GesManagerDelegate>delegate;
@property (nonatomic,strong)UIView* candleView;
@property (nonatomic,strong)SKLine_DataManager * dataManager;
@property (nonatomic,strong)SKLine_GesturePan * gesturePan;

- (void)addGesturePan;
- (void)setRecordPanIndex:(NSInteger)sRecordPanIndex;
- (void)unLockLoadMore;

@end

@protocol SKLine_GesManagerDelegate<NSObject>

-(void)gesManagerWithMove;

@end
