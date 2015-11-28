//
//  BitmapImagesandImageMasks.m
//  quartz_2D_Study
//
//  Created by stoull on 11/26/15.
//  Copyright © 2015 AChang. All rights reserved.
//



#import "BitmapImages.h"

static inline double radians (double degrees) {return degrees * M_PI/180;}


@implementation BitmapImages

/*

Quartz uses the following information when it creates a bitmap image (CGImageRef):

 A bitmap data source, which can be a Quartz data provider or a Quartz image source. Data Management in Quartz 2D describes both and discusses the functions that provide a source of bitmap data.
 
 An optional decode array (Decode Array).
 
 An interpolation setting, which is a Boolean value that specifies whether Quartz should apply an interpolation algorithm when resizing the image.
 
 A rendering intent that specifies how to map colors that are located within the destination color space of a graphics context. This information is not needed for image masks. See Setting Rendering Intent for more information.
 
 The image dimensions.
 
 The pixel format, which includes bits per component, bits per pixel, and bytes per row (Pixel Format).
 
 For images, color spaces and bitmap layout (Color Spaces and Bitmap Layout) information to describe the location of alpha and whether the bitmap uses floating-point values. Image masks don’t require this information.

*/

- (void)drawRect:(CGRect)rect {
    
//    Functions for creating images
/*
    CGImageCreate
    CGImageSourceCreateImageAtIndex
    CGImageSourceCreateThumbnailAtIndex
    CGBitmapContextCreateImage
    CGImageCreateWithImageInRect
    CGImageCreateCopy
    CGImageCreateCopyWithColorSpace
 */
    
    
    // Creating an Image From Part of a Larger Image
    CGContextRef currentRef = UIGraphicsGetCurrentContext();
    
    
    // 画出一个图片
    float myWidth = 240;
    float myHeight = 180;
    float lineWidth = 1;
    CGContextRef bigImageContext = MyCreateBitmapContextForBitmpImages(myWidth, myHeight);
    // 因为UIView 的坐标系 与quartz_2D 的坐标系不一样，所以图像会是反过来的，这里进行旋转
    // 旋转180度(注意旋转整个图层进行转换,所以在转动之后，要把画的图片给移回来，不然看不到)
    CGContextRotateCTM(bigImageContext, radians(180.0));
    CGContextTranslateCTM (bigImageContext, -myWidth, -myHeight);
    
    // 把图片画进去
    CGContextDrawImage(bigImageContext, CGRectMake(0, 0, myWidth, myHeight), [UIImage imageNamed:@"6"].CGImage);
    
    // 剪原来图片的选取区域
    CGRect cutImageArea = CGRectMake(50, 100, 80, 60);
    
    // 把选取的区域标识出来（之后经过CGBitmapContextCreateImage，坐标系会变成uiview的坐标系，所以这要对cutImageAreas进行转换，才能正确标识出位置）
    CGRect areaRect = CGRectMake(myWidth - cutImageArea.origin.x - cutImageArea.size.width - lineWidth, cutImageArea.origin.y - lineWidth, cutImageArea.size.width + 2*lineWidth, cutImageArea.size.height + 2*lineWidth);
    CGContextAddRect(bigImageContext, areaRect);
    CGContextSetStrokeColorWithColor(bigImageContext, [UIColor redColor].CGColor);
    CGContextSetLineWidth(bigImageContext, lineWidth);
    CGContextStrokePath(bigImageContext);
    
    // 画好图片的上下文变成图片
    CGImageRef bigCattleImageRef = CGBitmapContextCreateImage(bigImageContext);
    
    // 把选取的区域变成图片
    CGImageRef subImage = CGImageCreateWithImageInRect(bigCattleImageRef, cutImageArea);
    
    // 画原来的图片
    CGContextDrawImage(currentRef, CGRectMake(50, 100, myWidth, 180), bigCattleImageRef);
    
    
    // 画选取的那一部分图片
    CGRect subImageArea = CGRectMake(30, 320, 280, 210);
    CGContextDrawImage(currentRef, subImageArea, subImage);
    
    
    CGContextRelease(currentRef);
    CGImageRelease(bigCattleImageRef);
    CGImageRelease(subImage);
    CGContextRelease(bigImageContext);
    
    
}


// 新建一个新的上下文背景
CGContextRef MyCreateBitmapContextForBitmpImages (int pixelsWide,
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
