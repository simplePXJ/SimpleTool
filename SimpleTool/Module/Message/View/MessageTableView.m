//
//  MessageTableView.m
//  SimpleTool
//
//  Created by PXJ on 2017/10/16.
//  Copyright © 2017年 com. All rights reserved.
//

#import "MessageTableView.h"

@implementation MessageTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame messageStyle:(MessageTableViewStyle)style
{
    self = [super initWithFrame:frame];
    if (self) {
        self.style = style;
        [self initUI];
    }
    return self;
}
- (void)initUI{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, CGRectGetHeight(self.frame)) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    _tableView.bounces = NO;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"messageCell"];
    [self addSubview:_tableView];
    _tableView.estimatedRowHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    return 80;
//}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"messageCell" forIndexPath:indexPath];
    if (self.style ==MessageTableViewStyleSystem) {
        cell.textLabel.text = [NSString stringWithFormat:@"我是第%ld行",indexPath.row];

    }else{
        
        cell.textLabel.text = [NSString stringWithFormat:@"               我是第%ld行",indexPath.row];
        cell.textLabel.textAlignment = NSTextAlignmentRight;
    }
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    if (_tableView.contentOffset.y<=0) {
        _tableViewScrollTopBlock(YES);
        _tableView.scrollEnabled = NO;
    }
}
- (void)uploadTableViewSize:(CGSize)size{
    
    
}
@end
