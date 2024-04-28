//
//  MemberCenterMiddleMaxModel.h
//  SameCityLivingProject
//
//  Created by 闫继祥 on 2023/11/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MemberCenterMiddleMaxModel : NSObject

@property (nonatomic,copy)NSString *idStr;
//有限期
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *booth_nums;

@property (nonatomic,strong)NSArray *package;

+(instancetype)dataWithDic:(NSDictionary*)dic;

@end

NS_ASSUME_NONNULL_END
