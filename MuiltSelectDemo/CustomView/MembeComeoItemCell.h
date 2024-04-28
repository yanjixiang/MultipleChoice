//
//  MembeComeoItemCell.h
//  SameCityLivingProject
//
//  Created by 闫继祥 on 2023/11/5.
//

#import <UIKit/UIKit.h>
#import "MemberCenterMiddleModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MembeComeoItemCell : UICollectionViewCell
@property (nonatomic,strong)UIView *backView;
@property (nonatomic,strong)UILabel *titleL;
@property (nonatomic,strong)YYLabel *moneyL;
@property (nonatomic,strong)UILabel *desL;
@property (nonatomic,strong)UIButton *selectbtn;

@property (nonatomic,strong)MemberCenterMiddleModel *model;

@end

NS_ASSUME_NONNULL_END
