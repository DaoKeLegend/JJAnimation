//
//  ViewController.m
//  JJCoreAnimation_demo6
//
//  Created by lucy on 2017/9/24.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *animatedView;

@end

@implementation ViewController

#pragma mark - Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置UI
    [self setupUI];
    
    //位移动画
//    [self demoPositionAnimation];
    
    //旋转动画
//    [self demoRotationAnimation];
    
    //缩放
//    [self demoScaleAnimation];
    
    //组动画相关
    [self demoGroupAnimation];
}

#pragma mark - Object Private Function

- (void)demoGroupAnimation
{
    self.animatedView.frame = CGRectMake(50.0, 200.0, 100.0, 100.0);
    
    //向x方向移动
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    moveAnimation.toValue = [NSNumber numberWithFloat:200.0];
    
    //绕z轴旋转
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotationAnimation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    
    //缩放
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.autoreverses = YES;
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.4];
    
    //动画组
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 3.0;
    animationGroup.repeatCount = 10;
    animationGroup.animations = [NSArray arrayWithObjects:moveAnimation, rotationAnimation, scaleAnimation, nil];
    
    [self.animatedView.layer addAnimation:animationGroup forKey:@"move-rotate-scale-layer"];
}

- (void)demoScaleAnimation
{
    self.animatedView.frame = CGRectMake(50.0, 200.0, 200.0, 200.0);

    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    basicAnimation.duration = 3.0;
    basicAnimation.repeatCount = 10;
    basicAnimation.autoreverses = YES;
    
    //起始和终止位置
    basicAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    basicAnimation.toValue = [NSNumber numberWithFloat:0.4];
    
    //添加动画
    [self.animatedView.layer addAnimation:basicAnimation forKey:@"scale-layer"];
}

- (void)demoRotationAnimation
{
    
    self.animatedView.frame = CGRectMake(50.0, 200.0, 200.0, 200.0);
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    
    basicAnimation.duration = 3.0;
    basicAnimation.repeatCount = 10;
    
    //起始和终止位置
    basicAnimation.fromValue = [NSNumber numberWithFloat:0.0];;
    basicAnimation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    
    //添加动画
    [self.animatedView.layer addAnimation:basicAnimation forKey:@"rotate-layer"];
}

- (void)demoPositionAnimation
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    basicAnimation.duration = 2.0;
    basicAnimation.repeatCount = 100;
    
    //起始和终止位置
    basicAnimation.fromValue = [NSValue valueWithCGPoint:self.animatedView.layer.position];
    basicAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(300.0, 600.0)];
    
    //添加动画
    [self.animatedView.layer addAnimation:basicAnimation forKey:@"move-layer"];
}

- (void)setupUI
{
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.animatedView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 50.0, 50.0)];
    self.animatedView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.animatedView];
}

@end


















