//
//  TouchShowVC.m
//  SJNavigationBar
//
//  Created by shenj on 16/11/5.
//  Copyright © 2016年 wangjucheng. All rights reserved.
//

#import "TouchShowVC.h"

@interface TouchShowVC ()

@end

@implementation TouchShowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imgv = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:imgv];
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
    [self.view addSubview:lab];
    
    lab.textColor = [UIColor whiteColor];
    
    imgv.image = [UIImage imageNamed:_imgName];
    lab.text = _name;
}

#pragma maek - pop
- (NSArray *)previewActionItems {
    
    // action1
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"Action 1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        // 点击此选项触发
        
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleActionSheet];
        
        alertC = [UIAlertController alertControllerWithTitle:@"你查看的是:" message:[NSString stringWithFormat:@"图片%@", _imgName] preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *alert = [UIAlertAction actionWithTitle:@"噢噢" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertC addAction:alert];
        
        // 因为预览视图与根视图不在一个视图层级上，所以需要通过根视图去推出这个
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertC animated:YES completion:^{
            
        }];
        
    }];
    
    // 可以添加多个选项
    
    NSArray *arr = @[action1];
    
    return arr;
    
}


@end
