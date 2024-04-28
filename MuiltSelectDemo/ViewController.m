//
//  ViewController.m
//  MuiltSelectDemo
//
//  Created by 闫继祥 on 2024/4/28.
//

#import "ViewController.h"

#import "MembeComeoItemCell.h"

#import "MemberCenterComeoCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *taoCanViewArray;

@property (nonatomic,strong)UIButton *ensureBtn;



@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"开通课程VIP";
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    
    [self createUI];
    [self getData];
}

- (void)createUI {
    
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.bottom.offset(-kSafeAreaHeight - 10 - 48);
        make.top.offset(100);
        make.right.offset(0);
        
    }];
    
    
    [self.view addSubview:self.ensureBtn];
    [self.ensureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(48);
        make.left.offset(15);
        make.right.offset(-15);
        make.bottom.offset(-10 - kSafeAreaHeight);
    }];
    
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    if (@available(iOS 15.0, *)) {
        self.tableView.sectionHeaderTopPadding = 0;
    }
    
}
- (void)getData {
    
    self.taoCanViewArray = [NSMutableArray array];
    NSArray *arr = @[@{@"name":@"阿德力课程",@"package":@[@{@"price":@"1231",@"name":@"上册"},@{@"price":@"121",@"name":@"上册"},@{@"price":@"131",@"name":@"上册"},@{@"price":@"1231",@"name":@"下册"},@{@"price":@"111",@"name":@"下册"}]},
                     @{@"name":@"潜能识字",@"package":@[@{@"price":@"1231",@"name":@"上册"},@{@"price":@"121",@"name":@"上册"},@{@"price":@"131",@"name":@"上册"},@{@"price":@"1231",@"name":@"下册"},@{@"price":@"111",@"name":@"下册"}]},
                     @{@"name":@"潜能拼音",@"package":@[@{@"price":@"1231",@"name":@"上册"},@{@"price":@"121",@"name":@"上册"},@{@"price":@"131",@"name":@"上册"},@{@"price":@"1231",@"name":@"下册"},@{@"price":@"111",@"name":@"下册"}]},
                     @{@"name":@"潜能数学",@"package":@[@{@"price":@"1231",@"name":@"上册"},@{@"price":@"121",@"name":@"上册"},@{@"price":@"131",@"name":@"上册"},@{@"price":@"1231",@"name":@"下册"},@{@"price":@"111",@"name":@"下册"}]}
    ];
    for (NSDictionary *dic in arr) {
        MemberCenterMiddleMaxModel *model = [MemberCenterMiddleMaxModel dataWithDic:dic];
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *item in model.package) {
            MemberCenterMiddleModel *model1 = [MemberCenterMiddleModel dataWithDic:item];
            model1.isSelect = NO;
            [arr addObject:model1];
        }
        model.package = [arr mutableCopy];
        [self.taoCanViewArray addObject:model];
    }
    [self.tableView reloadData];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.taoCanViewArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MemberCenterComeoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = UIColor.whiteColor;
    [cell setSeparatorInset:UIEdgeInsetsZero];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.taoCanViewArray[indexPath.section];
    
    if (indexPath.section == 0) {
        cell.bodercolor = @"#FFD8AA";
        cell.topBackcolor = @"#FFECDB";
        cell.titlecolor = @"#6E340F";
        cell.rightImg.image = [UIImage imageNamed:@"mine_08"];
    }else if (indexPath.section == 1) {
        cell.bodercolor = @"#B0F8D0";
        cell.topBackcolor = @"#DDFFEC";
        cell.titlecolor = @"#1BA949";
        cell.rightImg.image = [UIImage imageNamed:@"mine_09"];
        
    }else if (indexPath.section == 2) {
        cell.bodercolor = @"#FCE894";
        cell.topBackcolor = @"#FDF7D0";
        cell.titlecolor = @"#6E340F";
        cell.rightImg.image = [UIImage imageNamed:@"mine_10"];
        
    }else if (indexPath.section == 3) {
        cell.bodercolor = @"#C2E8FF";
        cell.topBackcolor = @"#E6F3FF";
        cell.titlecolor = @"#0A70CC";
        cell.rightImg.image = [UIImage imageNamed:@"mine_11"];
        
    }else {
        cell.bodercolor = @"#FFD8AA";
        cell.topBackcolor = @"#FFECDB";
        cell.titlecolor = @"#6E340F";
        cell.rightImg.image = [UIImage imageNamed:@"mine_08"];
        
    }
    MemberCenterComeoCell * __weak weakCell = cell;
    cell.cellDidSelectActionBlock = ^(MemberCenterMiddleModel * _Nonnull model) {
        [self.taoCanViewArray enumerateObjectsUsingBlock:^(MemberCenterMiddleMaxModel *sectionModel, NSUInteger sectionIndex, BOOL *stop) {
            NSMutableArray *arr = [NSMutableArray array];
            for (MemberCenterMiddleModel *item in sectionModel.package) {
                if (model == item) {
                    item.isSelect =! item.isSelect;
                }
                [arr addObject:item];
                sectionModel.package = [arr mutableCopy];
                
            }
            [self.taoCanViewArray replaceObjectAtIndex:sectionIndex withObject:sectionModel];
            //            weakCell.model = sectionModel;
        }];
        [self.tableView reloadData];
        
    };
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [MemberCenterComeoCell viewHeight];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.001;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = UIColor.whiteColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[MemberCenterComeoCell class] forCellReuseIdentifier:@"cell"];
        //高度自适应
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 10;
        _tableView.estimatedSectionHeaderHeight =0;
        _tableView.estimatedSectionFooterHeight =0;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight |
        UIViewAutoresizingFlexibleWidth;
        
    }
    return _tableView;
    
}


- (UIButton *)ensureBtn {
    if (!_ensureBtn) {
        _ensureBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_ensureBtn setTitle:@"确认支付开通" forState:(UIControlStateNormal)];
        [_ensureBtn setTitleColor:UIColor.whiteColor forState:(UIControlStateNormal)];
        _ensureBtn.titleLabel.font = kFont(16);
        _ensureBtn.layer.cornerRadius = 12;
        _ensureBtn.layer.masksToBounds = YES;
        _ensureBtn.backgroundColor = kColor(@"#FF7802");
        [_ensureBtn addTarget:self action:@selector(ensureBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _ensureBtn;
}
- (void)ensureBtnClick {
    NSMutableArray *selectArray = [NSMutableArray array];
    for (MemberCenterMiddleMaxModel *model in self.taoCanViewArray) {
        for (MemberCenterMiddleModel *item in model.package) {
            if (item.isSelect == YES) {
                [selectArray addObject:item];
            }
        }
    }
    NSLog(@"选中的数组：%@",selectArray);
}
@end
