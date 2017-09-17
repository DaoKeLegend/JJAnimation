//
//  ViewController.m
//  JJGifAnimation_demo4
//
//  Created by lucy on 2017/9/17.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"
#import "FLAnimatedImageView.h"
#import "FLAnimatedImage.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - OVerride Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //找到路径文件
    NSString *pathStr = [[NSBundle mainBundle] pathForResource:@"gifAnimation.gif" ofType:nil];
    
    //将gif转化为NSData数据
    NSData *gifData = [NSData dataWithContentsOfFile:pathStr];
    
    //数据显示
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:gifData];
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
    imageView.animatedImage = image;
    imageView.frame = CGRectMake(100.0, 200.0, 200.0, 200.0);
    [self.view addSubview:imageView];
}

@end





