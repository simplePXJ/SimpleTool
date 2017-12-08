//
//  SKLine_DataModel.m
//  SimpleTool
//
//  Created by PXJ on 2017/12/5.
//  Copyright © 2017年 com. All rights reserved.
//

#import "SKLine_DataModel.h"
#import "SKLine_Coordinate.h"
@implementation SKLine_DataModel

- (id)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        self.closePrice = [self nullStringObject:dictionary[@"closePrice"] defaultValue:@""];
        self.highPrice = [self nullStringObject:dictionary[@"highPrice"] defaultValue:@""];
        self.lowPrice = [self nullStringObject:dictionary[@"lowPrice"] defaultValue:@""];
        self.openPrice = [self nullStringObject:dictionary[@"openPrice"] defaultValue:@""];
        self.productName = [self nullStringObject:dictionary[@"productName"] defaultValue:@""];
        self.timeStamp = [self nullStringObject:dictionary[@"timeStamp"] defaultValue:@""];
        self.totalQty = [self nullStringObject:dictionary[@"totalQty"] defaultValue:@""];
        self.type = [self nullStringObject:dictionary[@"type"] defaultValue:@""];
        self.volume = [[self nullStringObject:dictionary[@"volume"] defaultValue:@""] integerValue];
        self.coordinateModel = [[SKLine_Coordinate alloc] init];
    }
    return self;
}
-(id)nullStringObject:(id)object defaultValue:(id)defaultValue{
    if (object != nil && ![object isKindOfClass:[NSNull class]] && ![[NSString stringWithFormat:@"%@",object] isEqualToString:@"(null)"] && ![[NSString stringWithFormat:@"%@",object] isEqualToString:@"<null>"]) {
        return [NSString stringWithFormat:@"%@",object];
    }
    else{
        return defaultValue;
    }
}
@end
