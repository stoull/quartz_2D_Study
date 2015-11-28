//
//  Gradients.m
//  quartz_2D_Study
//
//  Created by stoull on 11/26/15.
//  Copyright © 2015 AChang. All rights reserved.
//

#import "Gradients.h"

@implementation Gradients

/*
 
 Quartz provides two opaque data types for creating gradients—CGShadingRef and CGGradientRef. You can use either of these to create axial or radial gradients. A gradient is a fill that varies from one color to another.
 
 
 
 The CGShadingRef opaque data type gives you control over how the color at each point in the gradient is computed. Before you can create a CGShading object, you must create a CGFunction object (CGFunctionRef) that defines a function for computing colors in the gradient.
 
 A CGGradient object is a subset of a CGShading object that’s designed with ease-of-use in mind. The CGGradientRef opaque data type is straightforward to use because Quartz calculates the color at each point in the gradient for you—you don’t supply a gradient calculation function.
 
 
 Differences between CGShading and CGGradient objects
 
 CGGradient

    Can use the same object to draw axial and radial gradients.
     
    Set the geometry of the gradient at drawing time.
     
    Quartz calculates the colors for each point in the gradient.
     
    Easy to define more than two locations and colors.
 
 
  CGShading
 
     Need to create separate objects for axial and radial gradients.

     Set the geometry of the gradient at object creation time.

     You must supply a callback function that calculates the colors for each point in the gradient.

     Need to design your callback to use more than two locations and colors, so it takes a bit more work on your part.

 
 
 */

- (void)drawRect:(CGRect)rect {
    
    
    // Using a CGGradient Object
    
    
    
   // 1. Create a CGGradient object, supplying a color space, an array of two or more color components, an array of two or more locations, and the number of items in each of the two arrays.
   // 2. Paint the gradient by calling either CGContextDrawLinearGradient or CGContextDrawRadialGradient and supplying a context, a CGGradient object, drawing options, and the stating and ending geometry (points for axial gradients or circle centers and radii for radial gradients).
   // 3.  Release the CGGradient object when you no longer need it.
    
    CGContextRef currentRef = UIGraphicsGetCurrentContext();
    
//    // Creating a CGGradient object
//    CGGradientRef myGrandient;
//    CGColorSpaceRef myColorspace;
//    size_t num_locations = 4;
//    CGFloat locations[4] = {0.0,0.5,0.8,1.0};
//    CGFloat components[16] = {1.0, 0.5, 0.4, 1.0,  // start color
//                             1.0, 0.5, 0.8, 1.0,
//                             1.0, 0.8, 0.8, 1.0,
//                             0.8, 0.8, 0.3, 1.0}; // End color
//    myColorspace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
//    myGrandient = CGGradientCreateWithColorComponents(myColorspace, components, locations, num_locations);
//    
//    
//    
//    // Painting an axial gradient using a CGGradinent object
//    CGPoint myStartPoint, myEndPoint;
//    myStartPoint.x = 100.0;
//    myStartPoint.y = 100.0;
//    myEndPoint.x = 200.0;
//    myEndPoint.y = 200.0;
//    CGContextDrawLinearGradient(currentRef, myGrandient, myStartPoint, myEndPoint, 0);
//    
//    
//    
//    // painting an radial gradient using a CGGradient object
//    CGPoint myStartPt, myEndPt;
//    CGFloat myStartRadius, myEndRadius;
//    myStartPt.x = self.frame.size.width - 60;
//    myStartPt.y = 150.0;
//    myEndPt.x = 0.0;
//    myEndPt.y = self.frame.size.height;
//    myStartRadius = 20.0;
//    myEndRadius = 100.0;
//    CGContextDrawRadialGradient (currentRef, myGrandient, myStartPt,
//                                 myStartRadius, myEndPt, myEndRadius,
//                                 kCGGradientDrawsAfterEndLocation);
    /*
    
    // Creating a CGradialGradient object
    CGGradientRef myRadialGrandient;
    CGColorSpaceRef myColorspace;
    size_t num_loca = 3;
    CGFloat locas[3] = { 0.0, 0.5, 1.0};
    CGFloat comps[12] = {  1.0, 1.0, 1.0, 1.0,
        0.5, 0.5, 0.5, 1.0,
        1.0, 1.0, 1.0, 1.0 };
    myColorspace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
    myRadialGrandient = CGGradientCreateWithColorComponents(myColorspace, comps, locas, num_loca);
    
    // The variables used to create a radial gradient by varying alpha
    CGPoint sheStartPoint, sheEndPoint;
    CGFloat sheStartRadius, sheEndRadius;
    sheStartPoint.x = 100;
    sheStartPoint.y = 400;
    sheEndPoint.x = 300;
    sheEndPoint.y = 500;
    sheStartRadius = 10;
    sheEndRadius = 100;
    
    CGContextDrawLinearGradient(currentRef, myRadialGrandient, sheStartPoint, sheEndPoint, 0);
    
    
    CGColorSpaceRelease(myColorspace);
    CGContextRelease(currentRef);
    CGGradientRelease(myRadialGrandient);
    
    */
    
    
    
    // Using a CGShading Object Painting an Axial Gradient Using a CGShading Object
    
    CGPoint     startPoint,
    endPoint;
    CGFunctionRef myFunctionObject;
    CGShadingRef myShading;
    
    startPoint = CGPointMake(40,200);
    endPoint = CGPointMake(340,200);
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    myFunctionObject = myGetFunction (colorspace);
    
    myShading = CGShadingCreateAxial (colorspace,
                                      startPoint, endPoint,
                                      myFunctionObject,
                                      false, false);
    
    // Clip the Context
    CGContextBeginPath (currentRef);
    CGContextAddArc (currentRef, 190, 200, 100, 0,
                     M_PI, 1);
    CGContextClosePath (currentRef);
    CGContextClip (currentRef);
    
    // Paint the Axial Gradient Using a CGShading Object
    CGContextDrawShading (currentRef, myShading);
    

    CGColorSpaceRelease (colorspace);// 13
    CGShadingRelease (myShading);
    CGFunctionRelease (myFunctionObject);
    
    
    // Painting a Radial Gradient Using a CGShading Object
    
    // ......
    
}







// Computing color component values
static void myCalculateShadingValues (void *info,
                                      const CGFloat *in,
                                      CGFloat *out)
{
    CGFloat v;
    size_t k, components;
    static const CGFloat c[] = {1, 0, .5, 0 };
    
    components = (size_t)info;
    
    v = *in;
    for (k = 0; k < components -1; k++)
        *out++ = c[k] * v;
    *out++ = 1;
}

// Set Up a CGFunction Object to Compute Color Values
static CGFunctionRef myGetFunction (CGColorSpaceRef colorspace)// 1
{
    size_t numComponents;
    static const CGFloat input_value_range [2] = { 0, 1 };
    static const CGFloat output_value_ranges [8] = { 0, 1, 0, 1, 0, 1, 0, 1 };
    static const CGFunctionCallbacks callbacks = { 0,// 2
        &myCalculateShadingValues,
        NULL };
    
    numComponents = 1 + CGColorSpaceGetNumberOfComponents (colorspace);// 3
    return CGFunctionCreate ((void *) numComponents, // 4
                             1, // 5
                             input_value_range, // 6
                             numComponents, // 7
                             output_value_ranges, // 8
                             &callbacks);// 9
}


@end

















