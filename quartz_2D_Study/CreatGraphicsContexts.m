//
//  CreatGraphicsContexts.m
//  quartz_2D_Study
//
//  Created by stoull on 11/20/15.
//  Copyright © 2015 AChang. All rights reserved.
//

#import "CreatGraphicsContexts.h"

@implementation CreatGraphicsContexts


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    
  //  Creating a Bitmap Graphics Context
//    CGContextRef contextRef = MyCreateBitmapContext(400, 300);
//    
//    CGContextRef myContext = UIGraphicsGetCurrentContext();
//    float myWidth = 400;
//    float myHeight = 300;
//    
//    // 创建一个context
//    CGContextRef myBitmapContext = MyCreateBitmapContext(myWidth, myHeight);
//    
//    CGRect myBoundingBox;// 1
//    
//    myBoundingBox = CGRectMake (0, 0, myWidth, myHeight);// 2
//    myBitmapContext = MyCreateBitmapContext (400, 300);// 3
//    // ********** Your drawing code here ********** // 4
//    // 在context上开始画东西
//    CGContextSetRGBFillColor (myBitmapContext, 1, 0, 0, 1);
//    CGContextFillRect (myBitmapContext, CGRectMake (0, 0, 200, 100 ));
//    CGContextSetRGBFillColor (myBitmapContext, 0, 0, 1, .5);
//    CGContextFillRect (myBitmapContext, CGRectMake (0, 0, 100, 200 ));
//    // 取得画好的东西
//    CGImageRef myImage = CGBitmapContextCreateImage (myBitmapContext);// 5
//    
//    // 将画好的东西画在当前的context上面
//    CGContextDrawImage(myContext, myBoundingBox, myImage);// 6
//    
//    // 释放内存
//    char *bitmapData = CGBitmapContextGetData(myBitmapContext); // 7
//    CGContextRelease (myBitmapContext);// 8
//    if (bitmapData) free(bitmapData); // 9
//    CGImageRelease(myImage);
//    
//    
    
}

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
