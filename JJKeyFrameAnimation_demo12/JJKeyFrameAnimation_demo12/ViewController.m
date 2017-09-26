//
//  ViewController.m
//  JJKeyFrameAnimation_demo12
//
//  Created by lucy on 2017/9/26.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"
#import <Keyframes/KFVector.h>
#import <Keyframes/KFVectorParsingHelper.h>
#import <Keyframes/KFVectorLayer.h>
#import <Keyframes/KFUtilities.h>

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];

    KFVector *sampleVector = [self loadSampleVectorFromDisk];
    
    KFVectorLayer *sampleVectorLayer = [KFVectorLayer new];
    const CGFloat shortSide = MIN(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
    const CGFloat longSide = MAX(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
    sampleVectorLayer.frame = CGRectMake(shortSide / 4, longSide / 2 - shortSide / 4, shortSide / 2, shortSide / 2);
    sampleVectorLayer.faceModel = sampleVector;
    [self.view.layer addSublayer:sampleVectorLayer];
    [sampleVectorLayer startAnimation];
}

#pragma mark - Object Private Function

- (KFVector *)loadSampleVectorFromDisk
{
    static KFVector *sampleVector;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"sample_logo" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSDictionary *sampleVectorDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        sampleVector = KFVectorFromDictionary(sampleVectorDictionary);
    });
    return sampleVector;
}

@end
