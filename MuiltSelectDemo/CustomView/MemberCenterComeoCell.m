//
//  MemberCenterComeoCell.m
//  SameCityLivingProject
//
//  Created by 闫继祥 on 2023/11/5.
//

#import "MemberCenterComeoCell.h"

#import "MembeComeoItemCell.h"

@interface MemberCenterComeoCell ()
@property (nonatomic,strong)UIView *topView;

@end

@implementation MemberCenterComeoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.backView];
        [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(15);
            make.right.offset(-15);
            make.top.offset(0);
            make.bottom.offset(0);
        }];
        
        [self.backView addSubview:self.topView];
        [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(0);
            make.right.offset(0);
            make.top.offset(0);
            make.height.mas_equalTo(44);
        }];
        
        [self.topView addSubview:self.titleL];
        [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(15);
            make.width.offset(150);
            make.top.offset(0);
            make.bottom.offset(0);
        }];
        
        [self.topView addSubview:self.rightImg];
        [self.rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-15);
            make.width.mas_equalTo(36);
            make.centerY.equalTo(self.topView);
            make.height.mas_equalTo(36);
        }];
        
        [self.backView addSubview:self.collectView];
        [self.collectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset(0);
            make.top.equalTo(self.topView.mas_bottom).offset(12);
            make.bottom.offset(0);
            //        make.height.mas_equalTo(@1).priorityLow();//设置一个高度，以便赋值后更新
        }];
        
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
//    self.backgroundColor = UIColor.clearColor;
}

- (void)setModel:(MemberCenterMiddleMaxModel *)model {
    _model = model;
    [self.collectView reloadData];
//    self.rightL.text = [NSString stringWithFormat:@"展示位：%@个",model.booth_nums];
    self.titleL.text = model.name;
}
- (void)setBodercolor:(NSString *)bodercolor {
    _bodercolor = bodercolor;
    self.backView.layer.borderColor = kColor(bodercolor).CGColor;

}
- (void)setTopBackcolor:(NSString *)topBackcolor {
    _topBackcolor = topBackcolor;
    self.topView.backgroundColor = kColor(topBackcolor);

}
- (void)setTitlecolor:(NSString *)titlecolor {
    _titlecolor = titlecolor;
    self.titleL.textColor = kColor(titlecolor);
}
- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = UIColor.whiteColor;
        _backView.layer.masksToBounds = YES;
        _backView.layer.borderWidth = 0.5;
        _backView.layer.cornerRadius = 6;
        
    }
    return _backView;
}
- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] init];
//        _line.backgroundColor = MainBackGroungColor;
    }
    return _topView;
}
- (UILabel *)titleL {
    if (!_titleL) {
        _titleL = [[UILabel alloc] init];
        _titleL.font = kBoldFont(14);
    }
    return _titleL;
}
- (UIImageView *)rightImg {
    if (!_rightImg) {
        _rightImg = [[UIImageView alloc] init];
        _rightImg.contentMode = UIViewContentModeScaleAspectFill;
        _rightImg.userInteractionEnabled = YES;
    }
    return _rightImg;
}
-(UICollectionView *)collectView{
    if (!_collectView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //        layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 50);
        _collectView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectView.backgroundColor = [UIColor clearColor];
        _collectView.delegate = self;
        _collectView.dataSource = self;
        _collectView.showsHorizontalScrollIndicator = NO;
        _collectView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        
        [_collectView registerClass:[MembeComeoItemCell class] forCellWithReuseIdentifier:@"cell"];
        //        _collectView.superview
        
       
        
        
    }
    return _collectView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.model.package.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MembeComeoItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    MemberCenterMiddleModel *model = self.model.package[indexPath.item];
    cell.model = model;
    
    return cell;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 10, 0, 10);//分别为上、左、下、右
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat item_height = 100;
//    CGFloat item_height1 = 128;
    CGFloat item_width = (kScreenW - 20 - 20) * 0.3;
//    CGFloat item_width1 = (kScreenW - 30 - 20) * 0.4;
    CGSize size = CGSizeMake(76,82);
//    MemberCenterMiddleModel *model = self.model.package[indexPath.item];
//    if (model.isSelect == YES) {
//        size = CGSizeMake(item_width1, item_height1);  // 初始大小，你可以选择和其他cell一样的大小
//    }
    
    return size;
    
}
//这个是两行cell之间的最小间距（上下行cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 7;
}
//两个cell之间的最小间距间距（同一行的cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 7;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.cellDidSelectActionBlock) {
        self.cellDidSelectActionBlock(self.model.package[indexPath.item]);
    }
    [self.collectView.collectionViewLayout invalidateLayout];
    
}

+ (CGFloat)viewHeight {
    return 150;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
