//
//  MembeComeoItemCell.m
//  SameCityLivingProject
//
//  Created by 闫继祥 on 2023/11/5.
//

#import "MembeComeoItemCell.h"

#import "YYLabel.h"

@implementation MembeComeoItemCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.backView];
        [self.backView addSubview:self.selectbtn];
        [self.backView addSubview:self.titleL];
        [self.backView addSubview:self.moneyL];
        [self.backView addSubview:self.desL];
        
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.backView layoutIfNeeded];
    
    self.backView.backgroundColor = kColor(@"#FFFDF4");
    //    CGFloat h = self.backView.height;
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.offset(0);
        make.bottom.offset(0);
    }];
    
    [self.selectbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(5);
        make.right.offset(-5);
        make.height.width.mas_equalTo(10);
    }];
    
    [self.moneyL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(2);
        make.right.offset(-2);
        make.top.equalTo(self.selectbtn.mas_bottom).offset(-3);
        make.height.mas_equalTo(25);
    }];
    
    [self.desL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(2);
        make.right.offset(-2);
        make.top.equalTo(self.moneyL.mas_bottom).offset(1);
        make.height.mas_equalTo(14);
        
    }];
    
    
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(2);
        make.right.offset(-2);
        make.top.equalTo(self.desL.mas_bottom).offset(4);
        make.height.mas_equalTo(26);
    }];
    
    
    

}
- (void)setModel:(MemberCenterMiddleModel *)model{
    _model = model;
    self.titleL.text = model.name;
    self.desL.text = @"永久";
    [self setPriceWithPrice:[NSString stringWithFormat:@"%@",model.price]];
    
    self.selectbtn.selected = model.isSelect;

    if (model.isSelect == YES) {
        self.backView.layer.borderColor = kColor(@"#FF7903").CGColor;
    }else {
        self.backView.layer.borderColor = kColor(@"#FFE8AE").CGColor;
    }
    
}

- (void)setPriceWithPrice:(NSString *)price {
    
    if (price.length == 0) {
        self.moneyL.text = @"¥0.00";
        return;
    }
    NSString *leftStr = @"¥";
    NSString *middleStr = [NSString stringWithFormat:@" %@",price];
    NSString *allstr = [NSString stringWithFormat:@"%@%@",leftStr,middleStr];
    
    NSMutableAttributedString *moneyStr = [[NSMutableAttributedString alloc] initWithString:allstr];
    [moneyStr addAttributes:@{NSForegroundColorAttributeName : kColor(@"#6E340F")} range:NSMakeRange(0, leftStr.length)];
    [moneyStr addAttributes:@{NSFontAttributeName: kBoldFont(12)} range:NSMakeRange(0, leftStr.length)];
    
    
    [moneyStr addAttributes:@{NSForegroundColorAttributeName : kColor(@"#6E340F")} range:NSMakeRange(leftStr.length, allstr.length-leftStr.length)];
    
    [moneyStr addAttributes:@{NSFontAttributeName: kBoldFont(18)} range:NSMakeRange(leftStr.length, allstr.length - leftStr.length)];
    
    self.moneyL.attributedText = moneyStr;
    self.moneyL.textAlignment = NSTextAlignmentCenter;

    
}
- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = kColor(@"#FCFCFF");
        _backView.layer.borderColor = kColor(@"#DFE4E9").CGColor;
        _backView.layer.masksToBounds = YES;
        _backView.layer.borderWidth = 1.0;
        _backView.layer.cornerRadius = 8.0;
    }
    return _backView;
}
- (UILabel *)titleL {
    if (!_titleL) {
        _titleL = [[UILabel alloc] init];
        _titleL.font = kFont(12);
        _titleL.textColor = kColor(@"#6E340F");
        _titleL.textAlignment = NSTextAlignmentCenter;
        _titleL.backgroundColor = kColor(@"#FFF4D8");
//        _titleL.userInteractionEnabled = NO;
        
    }
    return _titleL;
}
- (YYLabel *)moneyL {
    if (!_moneyL) {
        _moneyL = [[YYLabel alloc] init];
//        _moneyL.userInteractionEnabled = NO;
        
    }
    return _moneyL;
}
- (UILabel *)desL {
    if (!_desL) {
        _desL = [[UILabel alloc] init];
        _desL.font = kFont(10);
        _desL.textColor = [UIColor lightGrayColor];
        _desL.textAlignment = NSTextAlignmentCenter;
//        _desL.userInteractionEnabled = NO;
        
    }
    return _desL;
}
- (UIButton *)selectbtn {
    if (!_selectbtn) {
        _selectbtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_selectbtn setImage:[UIImage imageNamed:@"mine_06"] forState:(UIControlStateNormal)];
        [_selectbtn setImage:[UIImage imageNamed:@"mine_07"] forState:(UIControlStateSelected)];
        _selectbtn.userInteractionEnabled = NO;
    }
    return _selectbtn;
}
@end
