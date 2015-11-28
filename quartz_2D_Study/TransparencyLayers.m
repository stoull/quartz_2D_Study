//
//  TransparencyLayers.m
//  quartz_2D_Study
//
//  Created by stoull on 11/26/15.
//  Copyright © 2015 AChang. All rights reserved.
//

#import "TransparencyLayers.h"

@implementation TransparencyLayers

/*
 A transparency layer consists of two or more objects that are combined to yield a composite graphic. The resulting composite is treated as a single object. Transparency layers are useful when you want to apply an effect to a group of objects
 
 
 */
- (void)drawRect:(CGRect)rect {
    /*
     Painting to a Transparency Layer
     
     Painting to a transparency layer requires three steps:
     
     1. Call the function CGContextBeginTransparencyLayer.
     2. Draw the items you want to composite in the transparency layer.
     3. Call the function CGContextEndTransparencyLayer.
     
     */
    
    
    // Painting to a transparency layer
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGSize  sheShadowOffset = CGSizeMake(10, -20);
    CGContextSetShadow(currentContext, sheShadowOffset, 10);
    
    // 开始透明图层
    CGContextBeginTransparencyLayer(currentContext, NULL);
    
    CGContextSetFillColorWithColor(currentContext, [UIColor redColor].CGColor);
    CGContextFillRect(currentContext, CGRectMake(150, 100, 100, 100));
    
    CGContextSetFillColorWithColor(currentContext, [UIColor greenColor].CGColor);
    CGContextFillRect(currentContext, CGRectMake(100, 150, 100, 100));
    
    CGContextSetFillColorWithColor(currentContext, [UIColor blueColor].CGColor);
    CGContextFillRect(currentContext, CGRectMake(50, 200, 100, 100));
    

    // 结束透明图层
    CGContextEndTransparencyLayer(currentContext);
    
//    UIImage *nineImage = [UIImage imageNamed:@"6"];
//    [nineImage drawInRect:CGRectMake(50, 250, 200, 150)];
    
    CGContextRelease(currentContext);
    
    
}


@end
