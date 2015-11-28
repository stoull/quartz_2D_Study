//
//  ColorAndColorSpaces.m
//  quartz_2D_Study
//
//  Created by stoull on 11/19/15.
//  Copyright © 2015 AChang. All rights reserved.
//

#import "ColorAndColorSpaces.h"

@implementation ColorAndColorSpaces

/*
 
 A color in Quartz is represented by a set of values. The values are meaningless without a color space that dictates how to interpret color information.
 
 
Important: iOS does not support device-independent or generic color spaces. iOS applications must use device color spaces instead.
 
    1: Creating Device-Independent Color Spaces
 
         CGColorSpaceCreateLab
         CGColorSpaceCreateCalibratedRGB
         CGColorSpaceCreateCalibratedGray
 
    2: Creating Generic Color Spaces
        
         kCGColorSpaceGenericGray
         kCGColorSpaceGenericRGB
         kCGColorSpaceGenericCMYK
 
    3: Creating Device Color Spaces
 
         CGColorSpaceCreateDeviceGray for a device-dependent grayscale color space.
         CGColorSpaceCreateDeviceRGB for a device-dependent RGB color space.
         CGColorSpaceCreateDeviceCMYK for a device-dependent CMYK color space.

 
*/


// Setting Rendering Intent

/* The rendering intent specifies how Quartz maps colors from the source color space to those that are within the gamut of the destination color space of a graphics context. If you don’t explicitly set the rendering intent, Quartz uses relative colorimetric rendering intent for all drawing except bitmap (sampled) images. Quartz uses perceptual rendering intent for those.
 
     To set the rendering intent, call the function CGContextSetRenderingIntent, passing a graphics context and one of the following constants:

    1: kCGRenderingIntentDefault
    2: kCGRenderingIntentAbsoluteColorimetric
    3: kCGRenderingIntentRelativeColorimetric
    4: kCGRenderingIntentPerceptual
    5: kCGRenderingIntentSaturation

 */


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // Setting and Creating Colors
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextBeginPath(currentContext);
    CGContextMoveToPoint(currentContext, 100, 100);
    CGContextAddArc(currentContext, 100, 150, 50, 0, 3*M_PI/2, NO);
    CGContextClosePath(currentContext);
    
    CGContextSetRGBFillColor(currentContext, 0.0, 0.0, 1.0, 1.0);
    CGContextSetRGBStrokeColor(currentContext, 1.0, 1.0, 0.0, 1.0);
    CGContextSetLineWidth(currentContext, 10.0);
    CGContextDrawPath(currentContext, kCGPathEOFillStroke);
    
    
    CGMutablePathRef mutablePath = CGPathCreateMutable();
    CGPathAddArc(mutablePath, NULL, 250, 150, 50, 0, 3*M_PI/2, NO);
    CGPathCloseSubpath(mutablePath);
    
    CGContextAddPath(currentContext, mutablePath);
    CGContextSetCMYKFillColor(currentContext, 1.0, 1.0, 0.0, 0.0, 1.0);
    CGContextSetCMYKStrokeColor(currentContext, 0.5, 0.5, 0.0, 0.5, 1.0);
    CGContextSetLineWidth(currentContext, 10.0);
    CGContextDrawPath(currentContext, kCGPathEOFillStroke);
    
    // 设置渲染方式
    CGContextSetRenderingIntent(currentContext, kCGRenderingIntentSaturation);
    
    
    CGContextRelease(currentContext);
    
    
    
}


@end













