//
//  ViewController.m
//  JJGifAnimation_demo2
//
//  Created by lucy on 2017/9/17.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"
#import <ImageIO/ImageIO.h>

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //gif URL路径
    NSURL *gifURL = [[NSBundle mainBundle] URLForResource:@"gifAnimation" withExtension:@"gif"];
    
    //gif转图片
    CGImageSourceRef gifSource = CGImageSourceCreateWithURL((CFURLRef)gifURL, NULL);
    
    //图片个数
    size_t frameCount = CGImageSourceGetCount(gifSource);
    
    //将CGImage转化为UIImage，并存储在数组里面
    NSMutableArray *frameArrM = [NSMutableArray array];
    for (size_t i = 0; i < frameCount; i ++) {
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(gifSource, i, NULL);
        UIImage *image = [UIImage imageWithCGImage:imageRef];
        [frameArrM addObject:image];
        CGImageRelease(imageRef);
    }
    
    //动画显示
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:imageView];
    imageView.animationImages = [frameArrM copy];
    imageView.animationDuration = 1/10;
    [imageView startAnimating];
}

@end

































