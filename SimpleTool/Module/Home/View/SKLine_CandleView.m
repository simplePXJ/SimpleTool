//
//  SKLine_CandleView.m
//  SimpleTool
//
//  Created by PXJ on 2017/12/5.
//  Copyright © 2017年 com. All rights reserved.
//

#import "SKLine_CandleView.h"

@implementation SKLine_CandleView
{
    NSMutableArray * _candleArray;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setCandleArray:(NSMutableArray *)candleArray;
{
    _candleArray = [NSMutableArray arrayWithArray:candleArray];
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect
{
    float candleWidth = CGRectGetWidth(self.frame)/Control_Get_DefaultShowCandleNum;
    CGRect candleRect = CGRectMake(candleWidth/8/2, 0, candleWidth/8*6, 0);
    
    if (candleWidth>1.2) {
        [self drawCandleViewDefaultWithCandleWidth:candleWidth candleRect:candleRect];
    }else{
        
    }
}
- (void)drawCandleViewDefaultWithCandleWidth:(double)candleWidth candleRect:(CGRect)candleRect
{
    float maxPointX = 0;
    
    for (int i = 0 ; i<_candleArray.count; i++) {
        SKLine_DataModel * dataModel = _candleArray[i];
        SKLine_Coordinate * coordinateModel = dataModel.coordinateModel;
        maxPointX = candleWidth *i+candleRect.origin.x+CGRectGetWidth(candleRect)/2;
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGContextRef  context = UIGraphicsGetCurrentContext();
        
        double contextTop_Y = CGRectGetHeight(self.frame)/2.0;
        double contextHeight = CGRectGetHeight(self.frame)/2.0;
        
        UIColor * candleColor;
        if (dataModel.closePrice.doubleValue>=dataModel.openPrice.doubleValue) {
            candleColor = KColor.candleRed;
            contextTop_Y = coordinateModel.closePointY;
            contextHeight = coordinateModel.openPointY- coordinateModel.closePointY;
        }else{
            candleColor = KColor.candleGreen;
            contextTop_Y = coordinateModel.openPointY;
            contextHeight = coordinateModel.closePointY-coordinateModel.openPointY;
        }
     
        CGPathAddRect(path, NULL, CGRectMake(candleWidth*i+candleRect.origin.x, contextTop_Y, CGRectGetWidth(candleRect), contextHeight));
        [candleColor set];
        [candleColor setStroke];
        CGContextAddPath(context, path);
        CGContextSetLineWidth(context, 0);
        CGContextDrawPath(context, kCGPathFillStroke);
        CGPathRelease(path);
        
        CGContextRef contextLine = UIGraphicsGetCurrentContext();
        CGContextMoveToPoint(contextLine, maxPointX, coordinateModel.maxPointY);
        CGContextAddLineToPoint(contextLine, maxPointX, coordinateModel.minPointY);
        [candleColor set];
        CGContextSetLineWidth(contextLine, 0.5);
        CGContextStrokePath(contextLine);
        
    }
    
}

- (void)drawCandleViewSmallWithCandleWidth:(double)candleWidth candleRect:(CGRect)candleRect
{
    
}
@end
