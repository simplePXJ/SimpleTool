//
//  SKLine_DataModel.h
//  SimpleTool
//
//  Created by PXJ on 2017/12/5.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SKLine_Coordinate;
@interface SKLine_DataModel : NSObject

@property (nonatomic,strong)SKLine_Coordinate * coordinateModel;
@property (nonatomic,assign)NSInteger  skId;//自增ID
@property (nonatomic,strong)NSString * closePrice;//收盘价
@property (nonatomic,strong)NSString * highPrice;//最高价
@property (nonatomic,strong)NSString * lowPrice;//最低价
@property (nonatomic,strong)NSString * openPrice;//开盘价
@property (nonatomic,strong)NSString * productName;//品种code eg:HSI712
@property (nonatomic,strong)NSString * timeStamp;//时间
@property (nonatomic,strong)NSString * totalQty;//
@property (nonatomic,strong)NSString * type;//
@property (nonatomic,assign)NSInteger  volume;//买卖量
- (id)initWithDictionary:(NSDictionary *)dictionary;
@end

