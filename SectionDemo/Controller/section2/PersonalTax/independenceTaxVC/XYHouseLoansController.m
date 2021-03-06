//
//  XYHouseLoansController.m
//  SectionDemo
//
//  Created by 渠晓友 on 2019/11/22.
//  Copyright © 2019 渠晓友. All rights reserved.
//

#import "XYHouseLoansController.h"
#import "XYChooseLocationView.h"

@interface XYHouseLoansController ()
/** section 信息输入项 */
@property (nonatomic, strong)       UIView *myContentView;
@end

@implementation XYHouseLoansController

/// 配偶信息数据
- (NSArray <XYInfomationItem *>*)zinvInfos{
    
    // 0. 配偶信息
    NSArray *childInfos = @[
                            @{
                                @"title" : @"是否有配偶",
                                @"titleKey" : @"sfypo",
                                @"type" : @"1",
                                @"detail" : @""
                                },
                            @{
                                @"title" : @"配偶姓名",
                                @"titleKey" : @"nsrpoxm",
                                @"type" : @"0",
                                @"detail" : @"请输入姓名"
                                },
                            @{
                                @"title" : @"配偶证件类型",
                                @"titleKey" : @"nsrposfzjlx",
                                @"type" : @"1",
                                @"detail" : @"居民身份证"
                                },
                            @{
                                @"title" : @"配偶证件号码",
                                @"titleKey" : @"nsrposfzjhm",
                                @"type" : @"0",
                                @"detail" : @"请输入证件号码"
                                },
                            @{
                                @"title" : @"配偶出生日期",
                                @"titleKey" : @"nsrpocsrq",
                                @"type" : @"1",
                                @"detail" : @"请选择出生日期"
                                },
                            @{
                                @"title" : @"配偶国籍",
                                @"titleKey" : @"nsrpogj",
                                @"type" : @"1",
                                @"detail" : @"中国"
                                },
                            ];
    
    NSMutableArray *arrayM = @[].mutableCopy;
    for (NSDictionary *dict in childInfos) {
        NSString *value = nil;
        if ([dict[@"detail"] length]) {
            value = dict[@"detail"];
        }
        XYInfomationItem *item = [XYInfomationItem modelWithTitle:dict[@"title"] titleKey:dict[@"titleKey"] type:[dict[@"type"] integerValue] value:value placeholderValue:nil disableUserAction:NO];
        [arrayM addObject:item];
    }
    
    return arrayM;
}

/// 住房信息数据
- (NSArray <XYInfomationItem *>*)zhufangInfos{
    
    // 0. 配偶信息
    NSArray *childInfos = @[
                            @{
                                @"title" : @"房屋地址",
                                @"titleKey" : @"fwdz",
                                @"type" : @"1",
                                @"detail" : @"请选择省市区"
                                },
                            @{
                                @"title" : @"房屋详细地址",
                                @"titleKey" : @"jzdxxdz",
                                @"type" : @"0",
                                @"detail" : @"请输入街道,小区,楼栋,单元室等"
                                },
                            @{
                                @"title" : @"产权证明",
                                @"titleKey" : @"fwzslx",
                                @"type" : @"1",
                                @"detail" : @""
                                },
                            @{
                                @"title" : @"合同编号",
                                @"titleKey" : @"zsh",
                                @"type" : @"0",
                                @"detail" : @"必填项"
                                },
                            @{
                                @"title" : @"首套婚前贷款且婚后平均分配",
                                @"titleKey" : @"sfgzkc",
                                @"type" : @"1",
                                @"detail" : @"请选择"
                                },
                            @{
                                @"title" : @"是否本人贷款",
                                @"titleKey" : @"dkrsfbr",
                                @"type" : @"1",
                                @"detail" : @""
                                }
                            ];
    
    NSMutableArray *arrayM = @[].mutableCopy;
    for (NSDictionary *dict in childInfos) {
        NSString *value = nil;
        if ([dict[@"detail"] length]) {
            value = dict[@"detail"];
        }
        XYInfomationItem *item = [XYInfomationItem modelWithTitle:dict[@"title"] titleKey:dict[@"titleKey"] type:[dict[@"type"] integerValue] value:value placeholderValue:nil disableUserAction:NO];
        [arrayM addObject:item];
    }
    
    return arrayM;
}

/// 房贷信息数据
- (NSArray <XYInfomationItem *>*)fangdaiInfos{
    
    // 0. 配偶信息
    NSArray *childInfos = @[
                            @{
                                @"title" : @"房屋贷款类型",
                                @"titleKey" : @"fdlx",
                                @"type" : @"1",
                                @"detail" : @"请选择贷款方式"
                                },
                            @{
                                @"title" : @"贷款合同编号",
                                @"titleKey" : @"zfdkhtbh",
                                @"type" : @"0",
                                @"detail" : @"请按照贷款合同输入"
                                },
                            @{
                                @"title" : @"贷款银行",
                                @"titleKey" : @"dkyhmc",
                                @"type" : @"0",
                                @"detail" : @"请输入贷款银行",
                                },
                            @{
                                @"title" : @"首次还款日期",
                                @"titleKey" : @"schkrq",
                                @"type" : @"1",
                                @"detail" : @"请选择还款日期"
                                },
                            @{
                                @"title" : @"贷款期限（月数）",
                                @"titleKey" : @"dkys",
                                @"type" : @"0",
                                @"detail" : @"请输入贷款月数"  // 大于 0 的整数
                                }
                            ];
    
    NSMutableArray *arrayM = @[].mutableCopy;
    for (NSDictionary *dict in childInfos) {
        NSString *value = nil;
        if ([dict[@"detail"] length]) {
            value = dict[@"detail"];
        }
        XYInfomationItem *item = [XYInfomationItem modelWithTitle:dict[@"title"] titleKey:dict[@"titleKey"] type:[dict[@"type"] integerValue] value:value placeholderValue:nil disableUserAction:NO];
        [arrayM addObject:item];
    }
    
    return arrayM;
}



#pragma mark - LazyLoad properties

// 内容有: 子女信息,配偶信息,教育信息

- (UIView *)myContentView
{
    if (!_myContentView) {
        
        _myContentView = [UIView new];
        
        __weak typeof(self) weakSelf = self;
        
        // 2.
        XYTaxBaseTaxinfoSection *taxInfo = [XYTaxBaseTaxinfoSection taxSectionWithImage:@"icon_tax_peiou" title:@"配偶信息" infoItems:[self zinvInfos] handler:^(XYInfomationCell * _Nonnull cell) {
            [weakSelf sectionCellClicked:cell];
        }];
        // 配偶信息默认展示选择是否有配偶
        XYInfomationSection *poSection = taxInfo.subviews.lastObject;
        [poSection foldCellWithoutIndexs:@[@0]];
        
        XYTaxBaseTaxinfoSection *taxInfo2 = [XYTaxBaseTaxinfoSection taxSectionWithImage:@"icon_tax_zhufang" title:@"住房信息" infoItems:[self zhufangInfos] handler:^(XYInfomationCell * _Nonnull cell) {
            [weakSelf sectionCellClicked:cell];
        }];
        XYTaxBaseTaxinfoSection *taxInfo3 = [XYTaxBaseTaxinfoSection taxSectionCanAddWithImage:@"icon_tax_fangdai" title:@"房贷信息" infoItems:[self fangdaiInfos] handler:^(XYInfomationCell * _Nonnull cell) {
            [weakSelf sectionCellClicked:cell];
        }];
        
        [_myContentView addSubview:taxInfo];
        [_myContentView addSubview:taxInfo2];
        [_myContentView addSubview:taxInfo3];
        
        [taxInfo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_myContentView).offset(15);
            make.left.equalTo(_myContentView).offset(0);
            make.right.equalTo(_myContentView).offset(-0);
        }];
        
        [taxInfo2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(taxInfo.mas_bottom).offset(15);
            make.left.equalTo(_myContentView).offset(0);
            make.right.equalTo(_myContentView).offset(-0);
        }];
        
        [taxInfo3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(taxInfo2.mas_bottom).offset(15);
            make.left.equalTo(_myContentView).offset(0);
            make.right.equalTo(_myContentView).offset(-0);
            make.bottom.equalTo(_myContentView);
        }];
    }
    return _myContentView;
}


#pragma mark - life circle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 填充内容
    [self setContentView:self.myContentView];
    
    // 添加监听 - 是否有配偶 出生日期
    // 配偶信息默认展示选择是否有配偶
    XYTaxBaseTaxinfoSection *poSection = [_myContentView.subviews firstObject];

    // 配偶监听是否有配偶，没有配偶隐藏项目内其剩余他项目
    // 配偶监听出生日期，如果身份类型:身份证，身份证号码为正确的身份证号--->自动输入出生日期
    XYInfomationItem *poHas = poSection.cellsArray[0].model;
    [poHas addObserver:self forKeyPath:@"valueCode" options:NSKeyValueObservingOptionNew context:nil];
    XYInfomationItem *poBirth = poSection.cellsArray[3].model;
    [poBirth addObserver:self forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    // 1. 是否有配偶
    if ([[object valueForKey:@"titleKey"] isEqualToString:@"sfypo"]) {
        
        // 选择是否有配偶
        NSString *value = change[NSKeyValueChangeNewKey];
        
        XYTaxBaseTaxinfoSection *poSection = [_myContentView.subviews objectAtIndex:0];
        XYInfomationSection *section = [poSection.subviews lastObject];
        
        // 是否有配偶
        XYInfomationItem *item = poSection.cellsArray[0].model;
        if ( value && [item.valueCode isEqualToString:@"2"]) {
            
            // 合并配偶项目
            [section foldCellWithoutIndexs:@[@0]];
        }else
        {
            // 展开配偶项目
            [section foldCellWithIndexs:@[]];
        }
    }
    
    
    // 2. 配偶出生日期-判断证件号码
    if ([[object valueForKey:@"titleKey"] isEqualToString:@"nsrposfzjhm"]) {
        
        // 最新输入的身份证号
        NSString *value = change[NSKeyValueChangeNewKey];
        
        XYTaxBaseTaxinfoSection *poSection = [_myContentView.subviews objectAtIndex:0];
        XYInfomationSection *section = [poSection.subviews lastObject];
        
        // 证件类型
        XYInfomationItem *item = section.dataArray[2];
        if ([value isIDCard] && [item.valueCode isEqualToString:@"1"]) {
            
            NSString *birthday = [value birthdayFromIDCard];
                    
            XYInfomationItem *item = section.dataArray[4];
            item.value = birthday;
            item.valueCode = birthday;
            XYInfomationCell *cell = [section.subviews objectAtIndex:4];
            cell.model = item;
        }else
        {
            XYInfomationItem *item = section.dataArray[4];
            item.value = nil;
            item.valueCode = nil;
            XYInfomationCell *cell = [section.subviews objectAtIndex:4];
            cell.model = item;
        }
    }
}


#pragma mark - publicMethods

- (void)ensureBtnClick
{
    NSLog(@"实现父类的点击确定按钮页面。。。。。。。。%@",self);
    
    NSMutableArray *arrayM = @[].mutableCopy;
    for (XYInfomationSection *section in [self allSections]) {
        [arrayM addObject:section.contentKeyValues];
    }
    
    NSString *content = [NSString stringWithFormat:@"%@",arrayM];
    [[[UIAlertView alloc] initWithTitle:@"所填选内容" message:content delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil] show];
}

- (void)sectionCellClicked:(XYInfomationCell *)cell{

    if (cell.model.type == XYInfoCellTypeChoose) {
        
        // 处理要请求何种数据picker / datePicker / location
        if ([cell.model.titleKey isEqualToString:@"nsrpocsrq"] ||
            [cell.model.titleKey isEqualToString:@"schkrq"]) {
            [self showDatePickerForCell:cell];
        }else if(
                 [cell.model.titleKey isEqualToString:@"gzcs"] ||
                 [cell.model.titleKey isEqualToString:@"fwdz"]
                 )
        {
            [self showChooseLocationViewForCell:cell];
        }
        else
        {
            [self showPickerForCell:cell];
        }
    }
}

#pragma mark - XYPickerView 处理

- (void)showPickerForCell:(XYInfomationCell *)cell
{
    // 此处可以模拟比较耗时的数据请求,下面直接写到代码中了
    
    [XYPickerView showPickerWithConfig:^(XYPickerView * _Nonnull picker) {
       
        picker.dataArray = [DataTool dataArrayForKey:cell.model.titleKey];
        picker.title = [NSString stringWithFormat:@"选择%@",cell.model.title];
        
        // 可以自己设置默认选中行
        for (int i = 0; i < picker.dataArray.count; i++) {
            XYPickerViewItem *item = picker.dataArray[i];
            if ([item.title isEqualToString:cell.model.value]) {
                picker.defaultSelectedRow = i;
            }
        }
        
    } result:^(XYPickerViewItem * _Nonnull selectedItem) {
        NSLog(@"选择完成，结果为:%@",selectedItem);
        cell.model.value = selectedItem.title;
        cell.model.valueCode = selectedItem.code;
        cell.model = cell.model;
    }];
}

#pragma mark - XYChooseLocationView

- (void)showChooseLocationViewForCell:(XYInfomationCell *)cell
{
    // 外围地址数据
    NSArray *array = [DataTool cityArrayForPid:@"0"];
    NSArray *locations = [XYLocation mj_objectArrayWithKeyValuesArray:array];
    
    // 创建内容
    XYChooseLocationView *view = [XYChooseLocationView new];
    [self.view addSubview:view];
    view.baseDataArray = locations;
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ScreenH*0.45);
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(-0);
        make.bottom.equalTo(self.view).offset(-0);
    }];
    
    /// 创建一个coverView
    UIButton *btn = [UIButton new];
    btn.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.3];
    [btn addTarget:self action:@selector(coverBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:btn belowSubview:view];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    __weak typeof(cell) weakCell = cell;
    view.finishChooseBlock = ^(NSArray <NSString *>*locations) {
      
        [btn removeFromSuperview];
        
        if (!locations || [locations.firstObject isEqualToString:@"请选择"]) {
            return ;
        }
        
        NSLog(@"locations = %@",locations);
        
        NSMutableString *stringM = @"".mutableCopy;
        for (NSString *str in locations) {
            if ([str isEqualToString:locations.lastObject]) {
                [stringM appendFormat:@"%@",str];
            }else
            {
                [stringM appendFormat:@"%@,",str];
            }
            
        }
        
        weakCell.model.value = stringM;
        weakCell.model.valueCode = stringM;
        weakCell.model = weakCell.model;
    };
}

- (void)coverBtnClick:(id)sender
{
    for (UIView *subView in self.view.subviews) {
        if ([subView isKindOfClass:XYChooseLocationView.class]) {
            [subView removeFromSuperview];
        }
    }
    [sender removeFromSuperview];
}

#pragma mark - XYDatePicker 处理

- (void)showDatePickerForCell:(XYInfomationCell *)cell{
    
    NSTimeInterval yearSecond = 365 * 24 * 60 * 60;
    [XYDatePickerView showDatePickerWithConfig:^(XYDatePickerView * _Nonnull datePicker) {
        datePicker.datePickerMode = UIDatePickerModeDate;
        datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow: -50 * yearSecond];
        datePicker.maximumDate = [NSDate dateWithTimeIntervalSinceNow: -2 * yearSecond];
        datePicker.title = [@"选择" stringByAppendingString:cell.model.title];
        
        // 如果已经有选好的时间，默认展示对应的时间
        if ([cell.model.value isDateFromat]) {
            NSDateFormatter *mft = [NSDateFormatter new];
            mft.dateFormat = @"yyyy-MM-dd";
            NSDate *date = [mft dateFromString:cell.model.value];
            datePicker.date = date;
        }
        
    } result:^(NSDate * _Nonnull choosenDate) {
        
        NSLog(@"选择完成，结果为:%@",choosenDate);
        
        NSDateFormatter *mft = [NSDateFormatter new];
        mft.dateFormat = @"yyyy-MM-dd";
        NSString *dateStr = [mft stringFromDate:choosenDate];
        
        NSLog(@"选择完成，结果为:%@",dateStr);
        cell.model.value = dateStr;
        cell.model.valueCode = dateStr;
        cell.model = cell.model;
    }];
}

- (void)dealloc
{
    // 移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    // 移除KVO
    // [self removeObserver:self forKeyPath:@""];;
}


@end
