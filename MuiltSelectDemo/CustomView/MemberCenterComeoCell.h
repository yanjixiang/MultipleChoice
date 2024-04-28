//
//  MemberCenterComeoCell.h
//  SameCityLivingProject
//
//  Created by 闫继祥 on 2023/11/5.
//

#import <UIKit/UIKit.h>
#import "MemberCenterMiddleMaxModel.h"
#import "MemberCenterMiddleModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MemberCenterComeoCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)UICollectionView *collectView;
@property (nonatomic,strong)NSArray *allDataArray;
@property (nonatomic,strong)MemberCenterMiddleMaxModel *model;
@property (nonatomic,strong)UIView *backView;
@property (nonatomic,strong)UILabel *titleL;
@property (nonatomic,strong)UIImageView *rightImg;
@property (nonatomic,copy)void(^cellDidSelectActionBlock)(MemberCenterMiddleModel *model);
@property (nonatomic,copy)NSString *bodercolor;
@property (nonatomic,copy)NSString *topBackcolor;
@property (nonatomic,copy)NSString *titlecolor;


+ (CGFloat)viewHeight;

@end

NS_ASSUME_NONNULL_END
