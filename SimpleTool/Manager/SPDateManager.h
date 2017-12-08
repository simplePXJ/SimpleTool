//
//  SPDataManager.h
//  SimpleTool
//
//  Created by PXJ on 2017/11/29.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPDateManager : NSObject

@property (nonatomic,strong)NSDateFormatter * dateFormatter;
@property (nonatomic,strong)NSDate * nowDate;
@property (nonatomic,strong)NSString * nowDateStr;

+ (SPDateManager*)sharedInstance;
@end
