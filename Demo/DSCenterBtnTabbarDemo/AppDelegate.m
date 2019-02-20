//
//  AppDelegate.m
//  DSCenterButtonTabbarController
//
//  Created by cgw on 2019/2/20.
//  Copyright © 2019 bill. All rights reserved.
//

#import "AppDelegate.h"
#import "DSCenterButtonTabbarController.h"
#import "UITabBarController+Ext.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    DSCenterButtonTabbarController *tabbar = [[DSCenterButtonTabbarController alloc] initWithShowCenterButton:YES];
    
    //设置中心按钮属性
    UIButton *btn = tabbar.centerButton;
    [btn setTitle:@"中" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:30];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn.layer.cornerRadius = CGRectGetWidth(btn.frame)/2;
    btn.layer.masksToBounds = YES;
    [btn addTarget:self action:@selector(handleCenter) forControlEvents:UIControlEventTouchUpInside];
//    btn.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, 0);
    
    [((UITabBarController*)tabbar)  configTabbarWithCtrls:@[[UIViewController new],
                                                            [UIViewController new],
                                                            [UIViewController new],
                                                            [UIViewController new]]
                                                   titles:@[@"微信",@"淘宝",@"抖音",@"微博"]
                                         selectedImgNames:nil
                                           normalImgNames:nil
                                                textColor:[UIColor blackColor]
                                         selctedTextColor:[UIColor redColor]];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabbar;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)handleCenter{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Hello" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) { }];
    [alert addAction:action];
    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
}


@end
