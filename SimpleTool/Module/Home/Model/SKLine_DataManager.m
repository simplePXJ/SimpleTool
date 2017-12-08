//
//  SKLine_DataManager.m
//  SimpleTool
//
//  Created by PXJ on 2017/12/4.
//  Copyright © 2017年 com. All rights reserved.
//

#import "SKLine_DataManager.h"
#import "SKLine_CandleView.h"

@implementation SKLine_DataManager
{
    SKLine_DataModel * _recordDataModel;
    
}
- (instancetype)init{
    self = [super init];
    if (self) {
        [self dataConfiger];
    }
    return self;
}
- (void)dataConfiger{
    self.dataNet = [[SKLine_DataNet alloc] init];
    self.dataNet.delegate = self;
    self.allDataArray = [NSMutableArray arrayWithCapacity:0];
    self.currentQueenElementArray = [NSMutableArray arrayWithCapacity:0];
    self.currentIndex = -1;
    _recordDataModel = nil;
    [self getKlineDataTaday];

    
}

- (void)getKlineDataTaday{
    WS(ws);
    [_dataNet getKLineDataOfToday:^(NSMutableArray *dataArray) {
        dataArray = [NSMutableArray arrayWithArray:[ws dataLoor:dataArray]];
        BOOL init = YES;
        _allDataArray.count == 0 ? (init = YES) :(init = NO);
        _allDataArray = dataArray;
        
        if (_allDataArray.count<Control_Get_DefaultShowCandleNum+10) {
            [ws getKLineBeforeDataSelector];
        }else{
            if (init) {
                [ws dataComplete];
            }
            
            if (ws.currentIndex +Control_Get_DefaultShowCandleNum > _allDataArray.count&&!init) {
                [ws dataComplete];
            }else{
                [self findCurrentIndex];
            }
        }
   }];
}
-(void)getKLineBeforeDataSelector{
   
    [self.dataNet getKlineBehindData];
}
- (void)dataNetWithBehindData:(NSMutableArray *)dataArray
{
    
}
- (void)onlyMove{
    [self calculatePointWithCandleArray:self.currentQueenElementArray];
    if (self.delegate !=nil) {
        [self.delegate dataManageWithDataArray:self.currentQueenElementArray];
        [self.delegate dataManageWithResponse];
    }
    
    
}
#pragma mark data complete   -- init

- (void)dataComplete{
    
    [self dataCombination];
    [self calculatePointWithCandleArray:self.currentQueenElementArray];
    
    if (self.delegate) {
        [self.delegate dataManageWithDataArray:self.currentQueenElementArray];
        [self.delegate dataManageWithResponse];
    }
    [self findCurrentIndex];
}

- (void)dataCombination
{
    

    if(_allDataArray.count>Control_Get_DefaultShowCandleNum/4*3){
        if (self.currentIndex == -1) {
            self.currentIndex = _allDataArray.count - 1 - Control_Get_DefaultShowCandleNum/4*3;
        }else{
            if (self.currentIndex+Control_Get_DefaultShowCandleNum>_allDataArray.count) {
                self.currentIndex = _allDataArray.count-1-Control_Get_DefaultShowCandleNum/4*3;
            }
        }
        
        self.currentQueenElementArray = [NSMutableArray arrayWithCapacity:0];
        for (NSInteger i= self.currentIndex; i<_allDataArray.count; i++){
            [self.currentQueenElementArray addObject:_allDataArray[i]];
        }
    }else{
        self.currentIndex = 0;
        self.currentQueenElementArray = [NSMutableArray arrayWithArray:_allDataArray];
    }
}
-(void)findCurrentIndex{
    if (_recordDataModel == nil && _allDataArray.count > Control_Get_DefaultShowCandleNum / 4 * 3) {
        _recordDataModel = _allDataArray[_allDataArray.count - Control_Get_DefaultShowCandleNum / 4 * 3 - 1];
    }
    if (_recordDataModel != nil) {
        for (int i = 0; i < _allDataArray.count; i++) {
            SKLine_DataModel  *dataModel = _allDataArray[i];
            if ([dataModel.timeStamp isEqualToString:_recordDataModel.timeStamp]) {
                self.currentIndex = i;
                if ([self.delegate respondsToSelector:@selector(dataManageWithIndexFind:)]) {
                    [self.delegate dataManageWithIndexFind:self.currentIndex];
                }
                break;
            }
        }
    }
}
- (void)calculatePointWithCandleArray:(NSMutableArray *)candleArray
{
    if (candleArray ==nil ||candleArray.count<=0) {
        return;
    }
    
    double maxPrice = 0;
    double minPrice = 0;
    for (int i= 0; i<candleArray.count; i++) {
        SKLine_DataModel * kLineDataModel = candleArray[i];
        if (![kLineDataModel isKindOfClass:[SKLine_DataModel class]]) {
            continue;
        }
        double candleMaxPrice = [kLineDataModel.highPrice doubleValue];
        double candleMinPrice = [kLineDataModel.lowPrice doubleValue];
        
        if (candleMaxPrice!=0) {
            if (i==0) {
                maxPrice = candleMaxPrice;
            }else{
                maxPrice = maxPrice>candleMaxPrice?maxPrice:candleMaxPrice;
            }
        }
        if (candleMinPrice!=0) {
            if (i==0) {
                minPrice = candleMinPrice;
            }else{
                minPrice = minPrice<candleMinPrice?minPrice:candleMinPrice;
            }
        }
    }
    if (maxPrice==minPrice) {
        maxPrice = minPrice+pow(10, 0-[SKLine_DataControl shared].floatNum)*5;
    }
    self.currentMaxPrice = maxPrice;
    self.currentMinPrice = minPrice;
    for (int i = 0; i<candleArray.count; i++) {
        SKLine_DataModel * kLineDataModel = candleArray[i];
        if (![kLineDataModel isKindOfClass:[SKLine_DataModel class]]) {
            continue;
        }
        SKLine_Coordinate * coordinateModel = kLineDataModel.coordinateModel;
        coordinateModel.maxPointY = [self calculatePointWithPrice:[kLineDataModel.highPrice doubleValue]];
        coordinateModel.minPointY = [self calculatePointWithPrice:[kLineDataModel.lowPrice doubleValue]];
        coordinateModel.openPointY = [self calculatePointWithPrice:[kLineDataModel.openPrice doubleValue]];
        coordinateModel.closePointY = [self calculatePointWithPrice:[kLineDataModel.closePrice doubleValue]];
    }
}
- (double)calculatePointWithPrice:(double)price
{
    double pointSection = CGRectGetHeight(self.candleView.frame);
    double priceSection = self.currentMaxPrice- self.currentMinPrice;
    double scale = 1-(price -self.currentMinPrice)/priceSection;
    double pointY = pointSection * scale;
    return pointY;
}

#pragma mark Model Loor
-(NSMutableArray *)dataLoor:(NSMutableArray *)dataArray{
    NSMutableArray  *tmpMutableArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < dataArray.count; i++) {
        if (dataArray[i] != nil && ([dataArray[i] isEqualToString:@""] || [dataArray[i] rangeOfString:@"404 Not Found"].location != NSNotFound)) {
            break;
        }
        SKLine_DataModel *klineDataModel = [[SKLine_DataModel alloc]initWithDictionary:[self dictionaryWithJsonString:[dataArray[i] stringByAppendingString:@"}"]]];
        [tmpMutableArray addObject:klineDataModel];
    }
    return tmpMutableArray;
}
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    return dic;
}
@end
