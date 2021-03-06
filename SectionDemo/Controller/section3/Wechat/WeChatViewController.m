//
//  WeChatViewController.m
//  SectionDemo
//
//  Created by 渠晓友 on 2021/2/4.
//  Copyright © 2021 渠晓友. All rights reserved.
//

#import "WeChatViewController.h"

@implementation WeChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = HEXCOLOR(0xf6f6f6);
    [self setupContent];
}

#pragma mark - content
- (void)setupContent{
    [self setupMedium];
}
- (void)setupMedium{
    
    __weak typeof(WeChatViewController) *weakSelf = self;
    [self setContentWithData:[DataTool WechatPrivateData] itemConfig:^(XYInfomationItem * _Nonnull item) {
        item.titleWidthRate = 0.6;
        item.titleFont = [UIFont boldSystemFontOfSize:16];
    } sectionConfig:^(XYInfomationSection * _Nonnull section) {
        section.layer.cornerRadius = 0;
    }  sectionDistance:10 contentEdgeInsets:UIEdgeInsetsMake(0, 0, 30, 0) cellClickBlock:^(NSInteger index, XYInfomationCell * _Nonnull cell) {
        UIViewController *detail = [NSClassFromString(cell.model.titleKey) new];
        detail.title = cell.model.title;
        [weakSelf.navigationController pushViewController:detail animated:YES];
    }];
}

@end
