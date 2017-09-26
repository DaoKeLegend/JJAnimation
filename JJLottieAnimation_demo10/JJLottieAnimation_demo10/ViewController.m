//
//  ViewController.m
//  JJLottieAnimation_demo10
//
//  Created by mac on 2017/9/26.
//  Copyright © 2017年 DaoKeLegend. All rights reserved.
//

#import "ViewController.h"
#import "Lottie.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark -  Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    [self loadAnimation];
}

#pragma mark -  Object Private Function

- (void)loadAnimation
{
    LOTAnimationView *animationView = [LOTAnimationView animationNamed:@"data.json"];
    animationView.frame = self.view.frame;
    [self.view addSubview:animationView];
    
    [animationView playWithCompletion:^(BOOL animationFinished) {
        NSLog(@"动画结束了");
    }];
}

@end
