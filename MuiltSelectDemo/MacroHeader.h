//
//  MacroHeader.h
//  MuiltSelectDemo
//
//  Created by 闫继祥 on 2024/4/28.
//

#ifndef MacroHeader_h
#define MacroHeader_h

#define kScreenH  [UIScreen mainScreen].bounds.size.height  // 屏幕高
#define kScreenW  [UIScreen mainScreen].bounds.size.width   //屏幕宽度

// 判断手机是否为iPhone X
#define isIPhoneFill \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})


#define kNavigationHeight (isIPhoneFill?88:64)
#define kTabbarHeight (isIPhoneFill?83:49)
#define kSafeAreaHeight (isIPhoneFill?34:0)
#define kStatusHeight (isIPhoneFill?44:20)

#define kFont(ptSize)  [UIFont systemFontOfSize:ptSize]
#define kBoldFont(ptSize)  [UIFont boldSystemFontOfSize:ptSize]
#define kColor(color) [UIColor lee_colorWithHexString:color]

#endif /* MacroHeader_h */
