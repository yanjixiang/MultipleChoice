//
//  UIColor+Extention.m


#import "UIColor+Extention.h"

@implementation UIColor (Extention)

/** 黑色  色值#333333 */
+ (UIColor *)lee_blackColor {

    return [self lee_colorWithHexString:@"333333"];
}
/** 黑色  色值#666666 */
+ (UIColor *)lee_blackColor2 {

    return [self lee_colorWithHexString:@"666666"];
}
/** Tabbar选中状态颜色  色值#F8913E */

+ (UIColor *)lee_tabbarSelectedColor {

    return [self lee_colorWithHexString:@"F8913E"];
}
/** Tabbar选中状态颜色  色值#FD5047 */
+ (UIColor *)lee_redColor{
    
    return [self lee_colorWithHexString:@"FD5047"];
}

/** 灰色  色值#999999 */
+ (UIColor *)lee_grayColor {

    return [self lee_colorWithHexString:@"999999"];
}
/** 背景灰  色值#F5F5F5 */
+ (UIColor *)lee_backGroundColor {
    return [self lee_colorWithHexString:@"F5F5F5"];
}
/** 分割线颜色  色值#EDEDED */
+ (UIColor *)lee_separatorColor {

    return [self lee_colorWithHexString:@"EDEDED"];
}
/** 分割线颜色  色值#FD780F */
+ (UIColor *)lee_orangeColor {

    return [self lee_colorWithHexString:@"FD780F"];
}
/// 十六进制颜色
+ (UIColor *)lee_colorWithHexString:(NSString *)string {
    return [self lee_colorWithHexString:string alpha:1.0];
}
+ (UIColor *)lee_colorWithHexString:(NSString *)string alpha:(CGFloat)alpha {
    NSString *cleanString = [string stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF) / 255.0f;
    float green = ((baseValue >> 16) & 0xFF) / 255.0f;
    float blue = ((baseValue >> 8) & 0xFF) / 255.0f;
    
    return [self colorWithRed:red green:green blue:blue alpha:alpha];
}

/// RGB 颜色
+ (UIColor *)lee_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [self lee_colorWithRed:red green:green blue:blue alpha:1.0];
}
+ (UIColor *)lee_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [self colorWithRed:(red) / 255.0 green:(green) / 255.0 blue:(blue) / 255.0 alpha:(alpha) / 1.0];
}

/// 单值颜色
+ (UIColor *)lee_colorWithAValue:(CGFloat)aValue {
    return [self lee_colorWithAValue:aValue alpha:1.0];
}
+ (UIColor *)lee_colorWithAValue:(CGFloat)aValue alpha:(CGFloat)alpha {
    return [self lee_colorWithRed:aValue green:aValue blue:aValue alpha:alpha];
}

/// 随机颜色
+ (UIColor *)lee_colorWithRandom {
    return [self lee_colorWithRed:arc4random_uniform(255) green:arc4random_uniform(255) blue:arc4random_uniform(255) alpha:1.0];
}

#pragma mark - **************** 渐变色 ****************
+ (instancetype)bm_colorGradientChangeWithSize:(CGSize)size

                                     direction:(ZQGradientChangeDirection)direction

                                    startColor:(UIColor*)startcolor

                                      endColor:(UIColor*)endColor {

   if(CGSizeEqualToSize(size,CGSizeZero) || !startcolor || !endColor) {

        return nil;

    }

   CAGradientLayer *gradientLayer = [CAGradientLayer layer];

    gradientLayer.frame=CGRectMake(0,0, size.width, size.height);



    CGPoint startPoint =CGPointZero;

    if (direction == ZQGradientChangeDirectionDownDiagonalLine) {

        startPoint =CGPointMake(0.0,1.0);

    }

    gradientLayer.startPoint= startPoint;

   CGPoint endPoint = CGPointZero;

    switch(direction) {

        case ZQGradientChangeDirectionLevel:

            endPoint =CGPointMake(1.0,0.0);

            break;

        case ZQGradientChangeDirectionVertical:

            endPoint =CGPointMake(0.0,1.0);

            break;

        case ZQGradientChangeDirectionUpwardDiagonalLine:

            endPoint =CGPointMake(1.0,1.0);

            break;

        case ZQGradientChangeDirectionDownDiagonalLine:

            endPoint =CGPointMake(1.0,0.0);

            break;

        default:

            break;

    }

    gradientLayer.endPoint= endPoint;

   gradientLayer.colors=@[(__bridge id)startcolor.CGColor, (__bridge id)endColor.CGColor];

    UIGraphicsBeginImageContext(size);

    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];

    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return [UIColor colorWithPatternImage:image];

}

@end
