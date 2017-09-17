//
//  ViewController.m
//  JJSequenceAnimation_demo5
//
//  Created by lucy on 2017/9/17.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"

#define kJJTomVCColumnNumber   2

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) NSDictionary *animationDict;

@end

@implementation ViewController

#pragma mark - Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.animationDict = [NSDictionary dictionary];
    
    [self loadDict];
    
    [self setupUI];
}

#pragma mark - Object Private Function

- (void)setupUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    self.imageView = imageView;
    self.imageView.image = [UIImage imageNamed:@"tom"];
    [self.view addSubview:imageView];
    
    for (NSString *temp in self.animationDict) {
        [self addButtonsWithKey:temp];
    }
}

- (void)addButtonsWithKey:(NSString *)key
{
    static NSInteger i = 0;
    NSInteger btnW = 30 ,btnH = 30, btnX ,btnY, spaceX = 250, spaceY = 200;
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:key forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setImage:[UIImage imageNamed:key] forState:UIControlStateNormal];
    btnX = 30 + spaceX * (i % kJJTomVCColumnNumber);
    btnY = 50 + spaceY * (i / kJJTomVCColumnNumber);
    button.frame = CGRectMake(btnX, btnY, btnW, btnH);
    i++;
    
    [button addTarget:self action:@selector(playAnimationWithkey:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)loadDict
{
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"tom.plist" withExtension:nil]];
    self.animationDict = dict;
}

#pragma mark - Action && Notification

- (void)playAnimationWithkey:(UIButton *)button
{
    NSMutableArray *animationArr = [NSMutableArray array];
    
    for (NSInteger i = 0; i < [self.animationDict[button.titleLabel.text] integerValue]; i++) {
        
        NSString *imageName = [NSString stringWithFormat:@"%@_%02zd",button.titleLabel.text,i];
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"];
        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
        [animationArr addObject:image];
    }
    
    self.imageView.animationImages = animationArr;
    self.imageView.animationRepeatCount = 1;
    self.imageView.animationDuration = 2;
    [self.imageView startAnimating];
}

@end
