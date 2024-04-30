//
//  MemberCenterMiddleModel.h
//  SameCityLivingProject
//
//  Created by 闫继祥 on 2023/11/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MemberCenterMiddleModel : NSObject

@property (nonatomic,copy)NSString *idStr;
//有限期
@property (nonatomic,copy)NSString *expireday;
//价格
@property (nonatomic,copy)NSString *price;
//
@property (nonatomic,copy)NSString *name;

@property (nonatomic,assign)BOOL isSelect;


+(instancetype)dataWithDic:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
