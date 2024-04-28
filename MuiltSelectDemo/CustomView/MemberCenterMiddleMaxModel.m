//
//  MemberCenterMiddleMaxModel.m
//  SameCityLivingProject
//
//  Created by 闫继祥 on 2023/11/1.
//

#import "MemberCenterMiddleMaxModel.h"

@implementation MemberCenterMiddleMaxModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.idStr = value;
    }
    
}
+(instancetype)dataWithDic:(NSDictionary*)dic
{
    MemberCenterMiddleMaxModel *model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}
@end
