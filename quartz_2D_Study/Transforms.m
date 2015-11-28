//
//  Transforms.m
//  quartz_2D_Study
//
//  Created by stoull on 11/19/15.
//  Copyright © 2015 AChang. All rights reserved.
//

#import "Transforms.h"
#include <math.h>
static inline double radians (double degrees) {return degrees * M_PI/180;}

@implementation Transforms


/*
 
 Current transformation martrix  -- CTM
 
 You can modify the default user space by operating on the current transformation matrix, or CTM. After you create a graphics context, the CTM is the identity matrix. You can use Quartz transformation functions to modify the CTM and, as a result, modify drawing in user space.
 
 
 */

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing image
    
    //获得当前上下文背景
    CGContextRef myContext = UIGraphicsGetCurrentContext();
    
    // 创建一个新的context
    float myWidth = 400;
    float myHeight = 300;
    CGRect myBoundingBox;// 1
    myBoundingBox = CGRectMake (0, 0, myWidth, myHeight);// 2
    CGContextRef myBitmapContext = MyCreateBitmapContextTest(400, 300);// 3
    // ********** Your drawing code here ********** // 4
    
    // 画图案
//    CGContextSetRGBFillColor (myBitmapContext, 1, 0, 0, 1);
//    CGContextFillRect (myBitmapContext, CGRectMake (0, 0, 200, 100 ));
//    CGContextSetRGBFillColor (myBitmapContext, 0, 0, 1, .5);
//    CGContextFillRect (myBitmapContext, CGRectMake (0, 0, 100, 200 ));

#pragma -mark 对CMT进行旋转
    // view之所以能够显示视图，是因为它的上面有layer,将来图形也是渲染到layer上面,而且，旋转的时候是整个layer都旋转了
    // 旋转180度(注意旋转整个图层进行转换)
    CGContextRotateCTM(myBitmapContext, radians(180.0));
    
    // 缩放
    CGContextScaleCTM(myBitmapContext, .3, .8);
    
    // 旋转后可见图已经转到别的地方去了，要把它转回来
    CGContextTranslateCTM(myBitmapContext, -myWidth, -myHeight);
    
    // 画照片(这个时候的坐标系是不一样了，要注意！)
    CGRect imageRect = CGRectMake(100, 50, 250, 190);
    CGContextDrawImage(myBitmapContext, imageRect, [UIImage imageNamed:@"6"].CGImage);
    
    // 取context里面画好的东西
    CGImageRef myImage = CGBitmapContextCreateImage (myBitmapContext);// 5
    
    // 将取得的东西画到当到的context里面
    CGContextDrawImage(myContext, myBoundingBox, myImage);// 6
    
    // 释放画画时产生的内存
    char *bitmapData = CGBitmapContextGetData(myBitmapContext); // 7
    CGContextRelease (myBitmapContext);// 8
    if (bitmapData) free(bitmapData); // 9
    CGImageRelease(myImage);
    
}

// 新建一个新的上下文背景
CGContextRef MyCreateBitmapContextTest (int pixelsWide,
                                    int pixelsHigh)
{
    
    CGContextRef    context = NULL;
    CGColorSpaceRef colorSpace;
    void *          bitmapData;
    int             bitmapByteCount;
    int             bitmapBytesPerRow;
    
    bitmapBytesPerRow   = (pixelsWide * 4);// 1
    bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
    
    colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);// 2
    bitmapData = calloc(bitmapByteCount,bitmapBytesPerRow);// 3
    if (bitmapData == NULL)
    {
        fprintf (stderr, "Memory not allocated!");
        return NULL;
    }
    context = CGBitmapContextCreate (bitmapData,// 4
                                     pixelsWide,
                                     pixelsHigh,
                                     8,      // bits per component
                                     bitmapBytesPerRow,
                                     colorSpace,
                                     kCGImageAlphaPremultipliedLast);
    if (context== NULL)
    {
        free (bitmapData);// 5
        fprintf (stderr, "Context not created!");
        return NULL;
    }
    CGColorSpaceRelease( colorSpace );// 6
    
    return context;// 7
}


@end
