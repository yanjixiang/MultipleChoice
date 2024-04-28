//
//  AppDelegate.m
//  MuiltSelectDemo
//
//  Created by 闫继祥 on 2024/4/28.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    ViewController *rootViewController = [[ViewController alloc] init];
    [self.window setRootViewController:rootViewController];
    [self.window makeKeyAndVisible];
    
    return YES;
}




@end
