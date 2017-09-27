//
//  JJCoreGraphicView.m
//  JJCoreGraphicAnimation_demo13
//
//  Created by mac on 2017/9/27.
//  Copyright © 2017年 DaoKeLegend. All rights reserved.
//

#import "JJCoreGraphicView.h"

@implementation JJCoreGraphicView

#pragma mark -  Override Base Function

- (void)drawRect:(CGRect)rect
{
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    CGPoint center = CGPointMake(200.0, 300);
    CGFloat radius = 100.0;
    CGFloat startAngle = - M_PI_2;
    CGFloat endAngle = - M_PI_2 + self.progress * M_PI * 2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    [path setLineWidth:5.0];
    [[UIColor blueColor] setStroke];
    
    CGContextAddPath(contextRef, path.CGPath);
    
    CGContextStrokePath(contextRef);
}

#pragma mark -  Getter && Setter

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    [self setNeedsDisplay];
}

@end
