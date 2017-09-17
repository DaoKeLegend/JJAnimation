//
//  ViewController.m
//  JJGifAnimation_demo3
//
//  Created by lucy on 2017/9/17.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"
#import "SDWebImage/UIImage+GIF.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //找到路径文件
    NSString *pathStr = [[NSBundle mainBundle] pathForResource:@"gifAnimation.gif" ofType:nil];
    
    //将gif转化为NSData数据
    NSData *gifData = [NSData dataWithContentsOfFile:pathStr];
    
    UIImage *image = [UIImage sd_animatedGIFWithData:gifData];
    
    //显示
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:imageView];
    imageView.image = image;
}

@end
