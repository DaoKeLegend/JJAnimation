//
//  ViewController.m
//  JJUIViewAnimation_demo9
//
//  Created by lucy on 2017/9/24.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *animationView;

@end

@implementation ViewController

#pragma mark - Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //UI
    [self setupUI];
    
    //UIView简单动画
//    [self demoPropertyUIViewAnimation];
    
    //UIView转场动画
    [self demoTransitionUIViewAnimation];
    
    //UIView block动画
//    [self demoBlockUIViewAnimation];
}

#pragma mark - Object Private Function

- (void)demoBlockUIViewAnimation
{
    self.animationView.frame = CGRectMake(50.0, 250.0, 200.0, 200.0);
    
    [UIView animateWithDuration:3.0 animations:^{
        self.animationView.backgroundColor = [UIColor blueColor];
    } completion:^(BOOL finished) {
        NSLog(@"动画完成了");
    }];
}

- (void)demoTransitionUIViewAnimation
{
    self.animationView.frame = CGRectMake(50.0, 250.0, 200.0, 200.0);

    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:3.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(startAnimation)];
    [UIView setAnimationDidStopSelector:@selector(stopAnimation)];
    [UIView setAnimationRepeatCount:5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.animationView cache:YES];
    self.animationView.backgroundColor = [UIColor blueColor];
    [UIView commitAnimations];
}

- (void)demoPropertyUIViewAnimation
{
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:3.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(startAnimation)];
    [UIView setAnimationDidStopSelector:@selector(stopAnimation)];
    [UIView setAnimationRepeatCount:10];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.animationView.frame = CGRectMake(0.0, 0.0, 100.0, 100.0);
    [UIView commitAnimations];
}

- (void)setupUI
{
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.animationView = [[UIView alloc] initWithFrame:CGRectMake(250.0, 250.0, 200.0, 200.0)];
    [self.view addSubview:self.animationView];
    self.animationView.backgroundColor = [UIColor redColor];
}

#pragma mark - Action && Notification

- (void)startAnimation
{
    NSLog(@"开始动画");
}

- (void)stopAnimation
{
    NSLog(@"停止动画");
}

@end
