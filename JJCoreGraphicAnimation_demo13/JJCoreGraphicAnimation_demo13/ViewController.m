//
//  ViewController.m
//  JJCoreGraphicAnimation_demo13
//
//  Created by mac on 2017/9/27.
//  Copyright © 2017年 DaoKeLegend. All rights reserved.
//

#import "ViewController.h"
#import "JJCoreGraphicView.h"

@interface ViewController ()

@property (nonatomic, strong) JJCoreGraphicView *coregraphicView;
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

#pragma mark -  Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    JJCoreGraphicView *coregraphicView = [[JJCoreGraphicView alloc] initWithFrame:self.view.frame];
    coregraphicView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:coregraphicView];
    self.coregraphicView = coregraphicView;
    
    self.progress = 0.0;
    
    [self setupTimer];
}

#pragma mark -  Object Private Function

- (void)setupTimer
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerDidWork) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}

#pragma mark -  Action && Notification

- (void)timerDidWork
{
    if (self.progress >= 1.0) {
        [self.timer invalidate];
        self.timer = nil;
        return;
    }
    self.coregraphicView.progress = self.progress;
    self.progress += 0.1;
}

@end
