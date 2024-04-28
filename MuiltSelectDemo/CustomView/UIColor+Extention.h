//
//  UIColor+Extention.h


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ZQGradientChangeDirection) {

    ZQGradientChangeDirectionLevel,                               //水平方向渐变

    ZQGradientChangeDirectionVertical,                           //垂直方向渐变

    ZQGradientChangeDirectionUpwardDiagonalLine,    //主对角线方向渐变

    ZQGradientChangeDirectionDownDiagonalLine,       //副对角线方向渐变

};

@interface UIColor (Extention)


/** 常用颜色*/

/** 黑色  色值#333333 */
@property (class, nonatomic, readonly) UIColor *lee_blackColor;
/** 黑色  色值#666666 */
@property (class, nonatomic, readonly) UIColor *lee_blackColor2;
/** Tabbar选中状态颜色  色值#F8913E */
@property (class, nonatomic, readonly) UIColor *lee_tabbarSelectedColor;
/** Tabbar选中状态颜色  色值#FD5047 */
@property (class, nonatomic, readonly) UIColor *lee_redColor;
/** 灰色  色值#999999 */
@property (class, nonatomic, readonly) UIColor *lee_grayColor;
/** 背景灰  色值#F5F5F5 */
@property (class, nonatomic, readonly) UIColor *lee_backGroundColor;

/** 分割线颜色  色值#EDEDED */
@property (class, nonatomic, readonly) UIColor *lee_separatorColor;

/** 分割线颜色  色值#FD780F */
@property (class, nonatomic, readonly) UIColor *lee_orangeColor;



/** 十六进制颜色(alpha 为 1.0) */
+ (UIColor *)lee_colorWithHexString:(NSString *)string;

/** 十六进制颜色(alpha 自定义) */
+ (UIColor *)lee_colorWithHexString:(NSString *)string alpha:(CGFloat)alpha;

/** RGB 颜色(alpha 为 1.0) */
+ (UIColor *)lee_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
/** RGB 颜色(alpha 自定义) */
+ (UIColor *)lee_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

/** 单值颜色(alpha 为 1.0) */
+ (UIColor *)lee_colorWithAValue:(CGFloat)aValue;
/** 单值颜色(alpha 自定义) */
+ (UIColor *)lee_colorWithAValue:(CGFloat)aValue alpha:(CGFloat)alpha;

/** 随机颜色 */
+ (UIColor *)lee_colorWithRandom;

/*

          size:渐变区域的尺寸

  direction:渐变方向

 startColor:开始颜色

   endColor:结束颜色

 */

+ (instancetype)bm_colorGradientChangeWithSize:(CGSize)size

                                     direction:(ZQGradientChangeDirection)direction

                                    startColor:(UIColor*)startcolor

                                      endColor:(UIColor*)endColor;



#pragma mark - **************** 渐变色 ****************




@end

NS_ASSUME_NONNULL_END
