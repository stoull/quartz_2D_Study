//
//  ImageMasks.m
//  quartz_2D_Study
//
//  Created by stoull on 11/28/15.
//  Copyright © 2015 AChang. All rights reserved.
//

#import "ImageMasks.h"

static inline double radians (double degrees) {return degrees * M_PI/180;}

@implementation ImageMasks

/*
 
 Masking techniques can produce many interesting effects by controlling which parts of an image are painted. You can:
 
 Apply an image mask to an image. You can also use an image as a mask to achieve an effect that’s opposite from applying an image mask.
 
 Use color to mask parts of an image, which includes the technique referred to as chroma key masking.
 
 Clip a graphics context to an image or image mask, which effectively masks an image (or any kind of drawing) when Quartz draws the content to the clipped context.
 
 */


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGContextRef currentRef = UIGraphicsGetCurrentContext();
    
    // 创建一个图片
    CGFloat myWidth = 400;
    CGFloat myHeight = 300;
    
    CGContextRef mainImageContext = MyCreateBitmapContextForImagesMasks(myWidth, myHeight);
    // 因为UIView 的坐标系 与quartz_2D 的坐标系不一样，所以图像会是反过来的，这里进行旋转
    // 旋转180度(注意旋转整个图层进行转换,所以在转动之后，要把画的图片给移回来，不然看不到)
    CGContextRotateCTM(mainImageContext, radians(180.0));
    CGContextTranslateCTM (mainImageContext, -myWidth, -myHeight);
    
    CGContextDrawImage(mainImageContext, CGRectMake(0, 0, 400, 300), [UIImage imageNamed:@"sunflower"].CGImage);
    CGImageRef mainImageRef = CGBitmapContextCreateImage(mainImageContext);
    
    //  Masking an Image with an Image Mask
    
#pragma -mark cant work
    //  Masking an Image with an Image        不知道为什么没有用！
    
//    CGImageRef maskedImageRef = CGImageCreateWithMask([UIImage imageNamed:@"two_tigers"].CGImage, [UIImage imageNamed:@"two_tiger_mask"].CGImage);
    
    
    
    // Masking an Image with Color        不知道为什么没有用！
//    CGFloat colorMaskComponents[6] = {150,200,100,120,5,15};
//    CGImageRef colorMaskImageRef =  CGImageCreateWithMaskingColors(mainImageRef, colorMaskComponents);
    
    

    
    
    CGRect mainImageRect = CGRectMake(0, 0, 400, 300);
    CGContextDrawImage(currentRef, mainImageRect, mainImageRef);
    
    CGRect maskImageRect = CGRectMake(0, 350, 400, 300);
    CGContextDrawImage(currentRef, maskImageRect, mainImageRef);
    
    
    // Masking an Image by Clipping the Context
    CGContextClipToMask(currentRef, maskImageRect, [UIImage imageNamed:@"two_tiger_mask"].CGImage);
    
    
}





// 新建一个新的上下文背景
CGContextRef MyCreateBitmapContextForImagesMasks (int pixelsWide,
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
