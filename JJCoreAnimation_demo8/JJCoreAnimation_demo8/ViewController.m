//
//  ViewController.m
//  JJCoreAnimation_demo8
//
//  Created by lucy on 2017/9/24.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@property (nonatomic, strong) UIView *animateView;


@end

@implementation ViewController

#pragma mark - Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //UI
    [self setupUI];
    
    //值的方式关键帧动画
//    [self demoValuesKeyFrameAnimation];
    
    //路径方式关键帧动画
    [self demoPathKeyFrameAnimation];
}

#pragma mark - Object Private Function

- (void)demoPathKeyFrameAnimation
{
    self.animateView.frame = CGRectMake(0.0, 0.0, 100.0, 100.0);
    
    //路径的方式
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //设置路径
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    //沿着弧线运动
    CGPathAddEllipseInRect(pathRef, NULL, CGRectMake(100.0, 100.0, 100.0, 100.0));
    
    //起始位置
    CGPathMoveToPoint(pathRef, NULL, 0.0, 400.0);
    
    //直线运动
    CGPathAddLineToPoint(pathRef, NULL, 200.0, 300.0);
    CGPathAddLineToPoint(pathRef, NULL, 400.0, 300.0);
    CGPathAddLineToPoint(pathRef, NULL, 400.0, 500.0);
    CGPathAddLineToPoint(pathRef, NULL, 0.0, 500.0);
 
    //曲线运动
    CGPathAddCurveToPoint(pathRef, NULL, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0);
    
    //其他配置
    keyFrameAnimation.path = pathRef;
    CGPathRelease(pathRef);
    keyFrameAnimation.autoreverses = YES;
    keyFrameAnimation.repeatCount = 10;
    keyFrameAnimation.removedOnCompletion = NO;
    keyFrameAnimation.fillMode = kCAFillModeForwards;
    keyFrameAnimation.duration = 5.0;
    keyFrameAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.animateView.layer addAnimation:keyFrameAnimation forKey:nil];
    
}

- (void)demoValuesKeyFrameAnimation
{
    //值的方式
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //设置值数组
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(50.0, 300.0)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(350.0, 300.0)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(350.0, 500.0)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(50.0, 500.0)];
    
    keyFrameAnimation.values = @[value1, value2, value3, value4];
    
    keyFrameAnimation.repeatCount = 10.0;
    keyFrameAnimation.autoreverses = YES;
    keyFrameAnimation.duration = 4.0;
    keyFrameAnimation.removedOnCompletion = NO;
    keyFrameAnimation.fillMode = kCAFillModeForwards;
    keyFrameAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.animateView.layer addAnimation:keyFrameAnimation forKey:nil];
}

- (void)setupUI
{
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.animateView = [[UIView alloc] initWithFrame:CGRectMake(50.0, 200.0, 150.0, 150.0)];
    self.animateView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.animateView];
}

@end

















