//
//  ViewController.m
//  3DTouchDemo
//
//  Created by shenj on 16/11/5.
//  Copyright © 2016年 shenj. All rights reserved.
//

#import "ViewController.h"
#import "TouchShowVC.h"

@interface ViewController ()</** 3D touch Deleagte */UIViewControllerPreviewingDelegate>

@property (nonatomic ,strong) CATextLayer *subLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"3D touch";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self createTouchFrame];
    
    // 注册预览视图的代理和来源视图
    [self registerForPreviewingWithDelegate:(id)self sourceView:self.view];
    
}

- (void)createTouchFrame{
    
    
    //    CALayer;
    //    CATextLayer;
    //    CAShapeLayer;
    //    CAEAGLLayer;
    //    CATiledLayer;
    //    CAScrollLayer;
    //    CAEmitterLayer;
    //    CAGradientLayer;
    //    CATransformLayer;
    //    CAReplicatorLayer;
    
    _subLayer = [CATextLayer layer];
    [self.view.layer addSublayer:_subLayer];
    _subLayer.string = @"3D touch 此处有惊喜";
    
    _subLayer.contentsScale = 2;
    _subLayer.foregroundColor = [UIColor blackColor].CGColor;
    _subLayer.contentsScale = 2;
    _subLayer.frame = CGRectMake(100, 100, 200, 80);
    _subLayer.borderColor = [UIColor blackColor].CGColor;
    _subLayer.borderWidth = 1;
    _subLayer.fontSize = 14;
    //    _subLayer.font = (__bridge CFTypeRef _Nullable)(@"HiraKakuProN-W3");
    _subLayer.alignmentMode = kCAAlignmentCenter;
    
}

#pragma maek -- peek
/**-----3D touch  轻按 ---*/
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    
    NSLog(@"%.2f,%.2f",location.x,location.y);
    
    CGFloat x1 = _subLayer.frame.origin.x;
    CGFloat x2 = _subLayer.frame.origin.x + _subLayer.frame.size.width;
    
    CGFloat y1 = _subLayer.frame.origin.y;
    CGFloat y2 = _subLayer.frame.origin.y + _subLayer.frame.size.height;
    
    TouchShowVC *content = [[TouchShowVC alloc] init];
    
    content.imgName = @"IMG_2804.JPG";
    content.name = @"本人帅照一枚";
    
    //设置范围touch 反应范围
    
    if (location.x > x1 && location.x < x2 && location.y > y1 && location.y < y2) {
        return content;
    }else{
        return nil;
    }
    
}

/**-----3D touch  重按 ---*/
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    
    NSLog(@"重按--3D touch");
    
    viewControllerToCommit.view.backgroundColor = [UIColor whiteColor];
    
    [self showViewController:viewControllerToCommit sender:self];
    
}


@end
