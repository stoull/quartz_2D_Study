//
//  CCPicpaper.m
//  
//
//  Created by stoull on 10/26/15.
//
//

#import "Path.h"
#import <QuartzCore/QuartzCore.h>

@implementation Path

- (void)drawRect:(CGRect)rect {
////     first need to obtain the graphics context for the view
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    // set line width
//    CGContextSetLineWidth(context, 2.0);
//    // creat a color,here I creat a DeviceRGB, there have other like DeviceCMYK, and so no. and that's need some color elements
//    CGFloat components[] = {1.0, 0.0, 0.0, 1.0};
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGColorRef color = CGColorCreate(colorSpace, components);
//    // set stroke width
//    CGContextSetStrokeColorWithColor(context, color);
//    
//    // move one point to another point creat a path;
//    CGContextMoveToPoint(context, 0, 500);
//    CGContextAddLineToPoint(context, 10, 150);
//    CGContextAddLineToPoint(context, 30, 230);
//    CGContextAddLineToPoint(context, 100, 500);
//    CGContextAddLineToPoint(context, 120, 300);
//    CGContextAddLineToPoint(context, 123, 250);
//    CGContextAddLineToPoint(context, 150, 23);
//    CGContextAddLineToPoint(context, 200, 333);
//    CGContextAddLineToPoint(context, 230, 360);
//    CGContextAddLineToPoint(context, 250, 250);
//    CGContextAddLineToPoint(context, 280, 230);
//    CGContextAddLineToPoint(context, 300, 230);
//    CGContextAddLineToPoint(context, 320, 280);
//    
//    // everything is ready let's stroke it
//    CGContextStrokePath(context);
//    
//    // quartz2d is written by C, the memory is not managered by ARC, you need manager memory by youself, here release the object
//    CGContextRelease(context);
//    CGColorSpaceRelease(colorSpace);
//    CGColorRelease(color);
//    
////   get a new graphics context for the view
//    CGContextRef nowContext = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(nowContext, 5.0);
//    
//    // creat blue color
//    CGColorSpaceRef blueColorSpace = CGColorSpaceCreateDeviceRGB();
//    CGFloat blueComponents[] = {0.0, 0.0, 1.0, 1.0};
//    CGColorRef blueColor = CGColorCreate(blueColorSpace, blueComponents);
//    // set stroke color
//    CGContextSetStrokeColorWithColor(nowContext, blueColor);
//    //add a rect path to graphics context
//    CGRect rectangle = CGRectMake(60, 100, 200, 80);
//    CGContextAddRect(nowContext, rectangle);
//    // everything is ready again, stroking it
//    CGContextStrokePath(context);
//    
//    
//    
    // Drawing an Rectl
//
//    // creat yellow color
//    CGColorSpaceRef yellowColorSpace = CGColorSpaceCreateDeviceRGB();
//    CGFloat yellowComponents[] = {1.0, 1.0, 0.0, 1.0};// yellow = red + green;
//    CGColorRef yellowColor = CGColorCreate(yellowColorSpace, yellowComponents);
//    // set fill color
//    CGContextSetFillColorWithColor(nowContext, yellowColor);
//    // fill it
//    CGContextFillRect(nowContext, rectangle);
//    
//    // release the object
//    CGContextRelease(nowContext);
//    CGColorSpaceRelease(blueColorSpace);
//    CGColorRelease(blueColor);
//    CGColorSpaceRelease(yellowColorSpace);
//    CGColorRelease(yellowColor);
    
    
    
   // Drawing an Ellipse or Circle
    
//    CGContextRef ellipseContext = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(ellipseContext, 5.0);
//    
//    // unknow color
//    CGColorSpaceRef color1Space = CGColorSpaceCreateDeviceRGB();
//    CGFloat color1SpaceComponents[] = {0.3, 0.8, 0.8, 1.0};
//    CGColorRef color1 = CGColorCreate(color1Space, color1SpaceComponents);
//    
//    CGContextSetStrokeColorWithColor(ellipseContext, color1);
//    //create a rect
//    CGRect ellipseRect = CGRectMake(60, 300, 200, 80);
//    CGContextAddEllipseInRect(ellipseContext, ellipseRect);
//    CGContextStrokePath(ellipseContext);
//    
//    CGContextRelease(ellipseContext);
//    CGColorSpaceRelease(color1Space);
//    CGColorRelease(color1);
    
    
    //Filling a Path with a Color
    
//    CGContextRef fillContext = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(fillContext, [UIColor redColor].CGColor);
//    
//    CGContextMoveToPoint(fillContext, 10, 400);
//    CGContextAddLineToPoint(fillContext, 30, 350);
//    CGContextAddLineToPoint(fillContext, 50, 400);
//    CGContextAddLineToPoint(fillContext, 30, 450);
//    CGContextAddLineToPoint(fillContext, 10, 400);
//    CGContextFillPath(fillContext);
//    
//    CGContextRelease(fillContext);
    
    // Drawing an Arc
//    CGContextRef arcContext = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(arcContext, 4.0);
//    CGContextSetStrokeColorWithColor(arcContext, [UIColor colorWithRed:0.5 green:0.9 blue:0.5 alpha:1.0].CGColor);
//    CGContextMoveToPoint(arcContext, 100, 450);
//    CGContextAddArcToPoint(arcContext, 100, 550, 200, 550, 100);
//    CGContextStrokePath(arcContext);
//    CGContextRelease(arcContext);
    
    // Drawing a Quadratic Bézier Curve
//    CGContextRef quadContext = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(quadContext, 4.0);
//    CGContextSetStrokeColorWithColor(quadContext, [UIColor redColor].CGColor);
//    CGContextMoveToPoint(quadContext, 50, 150);
//    CGContextAddQuadCurveToPoint(quadContext, 50+255/2, 600, 300, 150);
//    CGContextStrokePath(quadContext);
//    CGContextRelease(quadContext);
    
    //Dashed Line Drawing
//    CGContextRef quadContext = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(quadContext, 50.0);
//    CGContextSetStrokeColorWithColor(quadContext, [UIColor redColor].CGColor);
//    CGContextMoveToPoint(quadContext, 50, 150);
//    CGFloat dashArray[] = {6,2};
//    CGContextSetLineDash(quadContext, 0, dashArray, 2);
////    CGContextAddQuadCurveToPoint(quadContext, 50+255/2, 600, 300, 150);
//    CGContextAddLineToPoint(quadContext, 300, 150);
//    CGContextStrokePath(quadContext);
//    
//    // 函数说明
//    void CGContextSetLineDash (
//                               CGContextRef c,            //绘图上下文
//                               CGFloat phase,             //画第一个点离开始的点距离
//                               const CGFloat lengths[],   //反复绘和不绘的数组。lengths的值｛6,2｝表示先绘制6个点，再跳过2个点，如此反复，如果把lengths值改为｛10, 20, 10｝，则表示先绘制10个点，跳过20个点，绘制10个点，跳过10个点，再绘制20个点，如此反复
//                               size_t count               //取上面数组的长度
//                               );
//    // 条形码
//    CGFloat width = 2;
//    CGContextMoveToPoint(quadContext, 50, 220);
//    CGFloat daArray[] = {6,width,9,width,2,width,0,width,5,width,6,width,7,width,2,width,0,width,6,width,8,width,3};
//    CGContextSetLineDash(quadContext, 0, daArray, 23);
//    CGContextAddLineToPoint(quadContext, 128, 220);
//    CGContextStrokePath(quadContext);
//    CGContextRelease(quadContext);
    
    
     // Drawing an Image into a Graphics Context
    
//     drawRect method code displays the image full size located at 0, 0:
    UIImage *image = [UIImage imageNamed:@"001"];
//    CGPoint imagePoint = CGPointMake(0, 0);
//    [image drawAtPoint:imagePoint];
//    
//    // Using the drawInRect method of the UIImage object we can scale the image to fit better on the screen
//    CGRect imageRect = CGRectMake(50, 300, 100, 100);
//    [image drawInRect:imageRect];
//    
    
    
    
    // Clipping to a Path
    CGContextRef pointImageContext = UIGraphicsGetCurrentContext();
    
    CGFloat width = 100;
    CGFloat heigth = 100;
    CGContextDrawImage(pointImageContext, CGRectMake(200, 400, width, heigth), image.CGImage);

    CGContextBeginPath (pointImageContext);
    CGContextAddArc (pointImageContext, 250, 450, ((width>heigth) ? heigth : width)/2, 0, 2*M_PI, 1);
    CGContextClosePath (pointImageContext);
    CGContextClip (pointImageContext);
    
    CGColorRef redcolor = [UIColor redColor].CGColor;
    CGContextSetStrokeColorWithColor(pointImageContext, redcolor);
    CGContextStrokePath(pointImageContext);
    
    
    
    // Darwing a line
//    CGContextRef specialLineContext = UIGraphicsGetCurrentContext();
//    CGContextMoveToPoint(specialLineContext, 100, 500);
//    CGContextAddLineToPoint(specialLineContext, 300, 500);
//    CGContextAddLineToPoint(specialLineContext, 200, 600);
//    
//    CGFloat rgbComponents[] = {1.0, 1.0, 0.0, 1.0};
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGColorRef color = CGColorCreate(colorSpace, rgbComponents);
//    
//    // CGColorRef redcolor = [UIColor redColor].CGColor;
//    CGContextSetLineJoin(specialLineContext,
//                         kCGLineJoinRound);
//    CGContextSetLineCap(specialLineContext, kCGLineCapRound);
//    CGContextSetStrokeColorWithColor(specialLineContext, color);
//    CGContextSetLineWidth(specialLineContext, 10.0);
//    CGContextStrokePath(specialLineContext);
    
    
    
//    // Filling a Path
//    CGContextRef currentContextRef = UIGraphicsGetCurrentContext();
//    
//    CGMutablePathRef mutablePathRef = CGPathCreateMutable();
//    CGPathAddArc(mutablePathRef, NULL, 180, 200, 100, 0, 3*M_PI/2, NO);
//    CGPathCloseSubpath(mutablePathRef);
//    CGPathAddArc(mutablePathRef, NULL, 180, 200, 50, 0,3*M_PI/2, NO);
////    CGPathCloseSubpath(mutablePathRef);
//    
//    
//    CGContextSetLineJoin(currentContextRef, kCGLineJoinRound);
//    CGContextSetLineCap(currentContextRef, kCGLineCapRound);
//    CGContextSetLineWidth(currentContextRef, 10);
//    
//    CGFloat rgbComponents[] = {0.0, 1.0, 1.0, 1.0};
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGColorRef greenColor = CGColorCreate(colorSpace, rgbComponents);
//    CGContextSetStrokeColorWithColor(currentContextRef, greenColor);
//    CGColorRef redcolor = [UIColor redColor].CGColor;
//    CGContextSetFillColorWithColor(currentContextRef, redcolor);
//    
//    CGContextAddPath(currentContextRef, mutablePathRef);
//    
//    // Fills and strokes the current path
//    CGContextDrawPath(currentContextRef, kCGPathEOFillStroke);
////    CGContextStrokePath(currentContextRef);
////    CGContextEOFillPath(currentContextRef);
    
    
    
    
}


@end
