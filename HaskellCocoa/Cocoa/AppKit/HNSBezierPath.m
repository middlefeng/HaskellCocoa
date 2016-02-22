//
//  HNSObject.m
//  
//
//  Created by middleware on 2/13/16.
//
//

#import <AppKit/AppKit.h>

#import "HNSBezierPath.h"


HsPtr hns_BezierPathWithRoundedRect(double x, double y, double w, double h,
                                    double xRadius, double yRadius)
{
    NSRect rect = NSMakeRect(x, y, w, h);
    NSBezierPath* path = [NSBezierPath bezierPathWithRoundedRect:rect
                                                         xRadius:xRadius
                                                         yRadius:yRadius];
    return (__bridge HsPtr)path;
}


void hns_bezierPath_stroke(HsPtr path)
{
    NSBezierPath* pPath = (__bridge NSBezierPath*)path;
    [pPath stroke];
}



void hns_bezierPath_setLineWidth(HsPtr path, double width)
{
    NSBezierPath* pPath = (__bridge NSBezierPath*)path;
    [pPath setLineWidth:width];
}

