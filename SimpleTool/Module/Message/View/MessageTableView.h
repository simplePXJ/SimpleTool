//
//  MessageTableView.h
//  SimpleTool
//
//  Created by PXJ on 2017/10/16.
//  Copyright © 2017年 com. All rights reserved.
//
typedef  enum{
    MessageTableViewStyleSystem,
    MessageTableViewStyleMine
}MessageTableViewStyle;

typedef void(^TableViewScrollTopBlock)(BOOL isTop);


#import <UIKit/UIKit.h>

@interface MessageTableView : UIView<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic,assign)MessageTableViewStyle style;

@property (nonatomic,strong)UITableView * tableView;

@property (copy)TableViewScrollTopBlock tableViewScrollTopBlock;


- (id)initWithFrame:(CGRect)frame messageStyle:(MessageTableViewStyle)style;

@end
