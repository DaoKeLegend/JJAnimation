//
//  ViewController.m
//  JJGifAnimation_demo1
//
//  Created by lucy on 2017/9/17.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 0.0, 375, 667)];
    webView.scalesPageToFit = YES;
    webView.opaque = NO;
    [self.view addSubview:webView];
    
    //找到路径文件
    NSString *pathStr = [[NSBundle mainBundle] pathForResource:@"gifAnimation.gif" ofType:nil];
    
    //将gif转化为NSData数据
    NSData *gifData = [NSData dataWithContentsOfFile:pathStr];
    
    //将gifData给WebView进行播放
    [webView loadData:gifData MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
}

@end







