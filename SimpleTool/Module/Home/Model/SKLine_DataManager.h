//
//  SKLine_DataManager.h
//  SimpleTool
//
//  Created by PXJ on 2017/12/4.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SKLine_DataManageDelegate;

@class SKLine_CandleView;
@interface SKLine_DataManager : NSObject<SKline_DataNetDelegate>

@property (nonatomic,weak)id <SKLine_DataManageDelegate>delegate;
@property (nonatomic,strong)SKLine_DataNet * dataNet;
@property (nonatomic,strong)SKLine_CandleView * candleView;

@property (nonatomic,strong)NSMutableArray * allDataArray;
@property (nonatomic,strong)NSMutableArray * currentQueenElementArray;
@property (nonatomic,assign)double currentMaxPrice;//当前显示最高价
@property (nonatomic,assign)double currentMinPrice;//当前显示最低价
@property (nonatomic,assign)NSInteger currentIndex;//当前页标记index;

-(void)getKLineBeforeDataSelector;
-(void)onlyMove;//mvoe

@end

@protocol SKLine_DataManageDelegate<NSObject>

- (void)dataManageWithDataArray:(NSMutableArray *)dataArray;
- (void)dataManageWithIndexFind:(NSInteger)index;
- (void)dataManageWithResponse;
@end
