//
//  AppDelegate.m
//  3DTouchDemo
//
//  Created by shenj on 16/11/5.
//  Copyright © 2016年 shenj. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    
    [self create3Dtouch];
    return YES;
}

#pragma maek - Home Screen Quick Actions
- (void)create3Dtouch{
    
    UIApplicationShortcutItem * item = [[UIApplicationShortcutItem alloc]initWithType:@"1" localizedTitle:@"标签1" localizedSubtitle:@"sub-1" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLove] userInfo:nil];
    
    UIApplicationShortcutItem * itemTwo = [[UIApplicationShortcutItem alloc]initWithType:@"2" localizedTitle:@"标签2" localizedSubtitle:@"sub-2" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeDate] userInfo:nil];
    
    UIApplicationShortcutItem * itemThird = [[UIApplicationShortcutItem alloc]initWithType:@"3" localizedTitle:@"标签3" localizedSubtitle:@"sub-3" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch] userInfo:nil];
    
    UIApplicationShortcutItem * itemFouce = [[UIApplicationShortcutItem alloc]initWithType:@"4" localizedTitle:@"标签4" localizedSubtitle:@"sub-4" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeHome] userInfo:nil];
    
    [UIApplication sharedApplication].shortcutItems = @[item, itemTwo, itemThird ,itemFouce];
    
}


/** ----- 3D touch ----- */
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler{
    
    switch (shortcutItem.type.integerValue) {
        case 1:
        {
            NSLog(@"short -- 1");
            
            // 展示控制器
            UIActivityViewController *vc = [[UIActivityViewController alloc]initWithActivityItems:@[@"3D touch short - 1"] applicationActivities:nil];
            
            //设置当前的VC 为rootVC
            
            [self.window.rootViewController presentViewController:vc animated:YES completion:^{
                
            }];
            
        }
            break;
        case 2:
        {
            NSLog(@"short -- 2");
            
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"OPPS!" message:@"啦啦啦" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alertC addAction:alert];
            
            [self.window.rootViewController presentViewController:alertC animated:YES completion:^{
                
            }];
            
        }
            break;
        case 3:
        {
            NSLog(@"short -- 3");
        }
            break;
        case 4:
        {
            NSLog(@"short -- 4");
        }
            break;
            
        default:
            break;
    }
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
