//
//  ViewController.m
//  JJCoreAnimation_demo7
//
//  Created by lucy on 2017/9/24.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <CAAnimationDelegate>

@property (nonatomic, strong) UIView *animatedView;

@end

@implementation ViewController

#pragma mark - override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置UI
    [self setupUI];
    
    //位移动画
    [self demoPositionAnimation];
}

#pragma mark - Object Private Function

- (void)demoPositionAnimation
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    basicAnimation.duration = 1.0;
    basicAnimation.repeatCount = 1;
    basicAnimation.delegate = self;
    
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

#pragma mark - CAAnimationDelegate

- (void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"animation = %@", anim);
    NSLog(@"动画开始了");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"animation = %@", anim);
    NSLog(@"Flag = %d", flag);
    NSLog(@"动画结束了");
}

@end
