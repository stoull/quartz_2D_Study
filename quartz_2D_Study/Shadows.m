//
//  Shadows.m
//  quartz_2D_Study
//
//  Created by stoull on 11/25/15.
//  Copyright © 2015 AChang. All rights reserved.
//

#import "Shadows.h"

@implementation Shadows

/*
 Shadows have three characteristics:
 
 An x-offset, which specifies how far in the horizontal direction the shadow is offset from the image.
 A y-offset, which specifies how far in the vertical direction the shadow is offset from the image.
 A blur value, which specifies whether the image has a hard edge, as seen in the left side of Figure 7-2, or a diffuse edge, as seen in the right side of the figure.
 
 */


//- (void)drawRect:(CGRect)rect {
//    CGContextRef contextRef = UIGraphicsGetCurrentContext();
//    
//    MyDrawWithShadows(contextRef, 100, 100);
//    
//
//}
//
//
//
//// A function that sets up shadows
//void MyDrawWithShadows (CGContextRef myContext, // 1
//                        CGFloat wd, CGFloat ht)
//{
//    CGSize          myShadowOffset = CGSizeMake (-15,  20);// 2
//    CGFloat           myColorValues[] = {1, 0, 0, .6};// 3
//    CGColorRef      myColor;// 4
//    CGColorSpaceRef myColorSpace;// 5
//    
//    CGContextSaveGState(myContext);// 6
//    
//    CGContextSetShadow (myContext, myShadowOffset, 5); // 7
//    
//    CGContextMoveToPoint(myContext, 100, 300);
//    CGContextAddLineToPoint(myContext, 100, 400);
//    CGContextSetStrokeColorWithColor(myContext, [UIColor redColor].CGColor);
//    CGContextSetLineWidth(myContext, 5);
//    CGContextStrokePath(myContext);
//    
//    UIImage *nineImage = [UIImage imageNamed:@"6"];
//    [nineImage drawInRect:CGRectMake(50, 390, 200, 150)];
//    
//    // Your drawing code here// 8
//    CGContextSetRGBFillColor (myContext, 0, 1, 0, 1);
//    CGContextFillRect (myContext, CGRectMake (wd/3 , ht/2 + 100 , wd, ht));
//    
//    myColorSpace = CGColorSpaceCreateDeviceRGB ();// 9
//    myColor = CGColorCreate (myColorSpace, myColorValues);// 10
//    CGContextSetShadowWithColor (myContext, myShadowOffset, 5, myColor);// 11
//    
//    // Your drawing code here// 12
//    CGContextSetFillColorWithColor(myContext, [UIColor blueColor].CGColor);
//    CGContextFillRect (myContext, CGRectMake (wd/3 + 150,ht/2+100,wd,ht));
//    
//    CGColorRelease (myColor);// 13
//    CGColorSpaceRelease (myColorSpace); // 14
//    
//    CGContextRestoreGState(myContext);// 15
//}
//
//
//
//// 创建一个新bitmap上下文背景
//
//CGContextRef MyCreateBitmapContext (int pixelsWide,
//                                    int pixelsHigh)
//{
//
//    CGContextRef    context = NULL;
//    CGColorSpaceRef colorSpace;
//    void *          bitmapData;
//    int             bitmapByteCount;
//    int             bitmapBytesPerRow;
//
//    bitmapBytesPerRow   = (pixelsWide * 4);// 1
//    bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
//
//    colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);// 2
//    bitmapData = calloc(bitmapByteCount,bitmapBytesPerRow);// 3
//    if (bitmapData == NULL)
//    {
//        fprintf (stderr, "Memory not allocated!");
//        return NULL;
//    }
//    context = CGBitmapContextCreate (bitmapData,// 4
//                                     pixelsWide,
//                                     pixelsHigh,
//                                     8,      // bits per component
//                                     bitmapBytesPerRow,
//                                     colorSpace,
//                                     kCGImageAlphaPremultipliedLast);
//    if (context== NULL)
//    {
//        free (bitmapData);// 5
//        fprintf (stderr, "Context not created!");
//        return NULL;
//    }
//    CGColorSpaceRelease( colorSpace );// 6
//
//    return context;// 7
//}

@end
