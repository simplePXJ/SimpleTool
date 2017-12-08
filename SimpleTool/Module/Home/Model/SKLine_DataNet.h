//
//  SKLine_DataNet.h
//  SimpleTool
//
//  Created by PXJ on 2017/12/5.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SKline_DataNetDelegate;

@interface SKLine_DataNet : NSObject

@property (nonatomic,weak)id <SKline_DataNetDelegate>delegate;
@property (nonatomic,assign)NSInteger currentDate;
@property (nonatomic,assign)NSInteger recordFailCount;


+(SKLine_DataNet*)shared;

-(void)getKlineBehindData;

-(void)getKLineDataOfToday:(void(^)(NSMutableArray *dataArray))complete;

-(void)getKLineDataWithDate:(NSInteger)date
                   complete:(void(^)(BOOL Success, NSMutableArray *dataArray))complete;

@end

@protocol SKline_DataNetDelegate<NSObject>

- (void)dataNetWithBehindData:(NSMutableArray *)dataArray;

@end
