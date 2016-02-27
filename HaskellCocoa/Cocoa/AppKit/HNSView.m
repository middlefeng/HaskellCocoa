//
//  HNSObject.m
//  
//
//  Created by middleware on 2/13/16.
//
//

#import <AppKit/AppKit.h>

#import "HNSView.h"
#import "HNSObject.h"
#import "HNSGeometry.h"



HsPtr hns_ViewCreate(void)
{
    NSView* pView = [[NSView alloc] init];
    hns_retain(pView);
    return (__bridge HsPtr)pView;
}


void hns_view_addSubview(HsPtr view, HsPtr subview)
{
    NSView* pView = (__bridge NSView *)(view);
    NSView* pSubview = (__bridge NSView *)(subview);
    [pView addSubview:pSubview];
}



void hns_view_removeFromSuperview(HsPtr view)
{
    NSView* pView = (__bridge NSView *)(view);
    [pView removeFromSuperview];
}


void hns_view_setFrame(HsPtr view, double x, double y, double width, double height)
{
    NSView* pView = (__bridge NSView *)(view);
    NSRect frame = NSMakeRect(x, y, width, height);
    [pView setFrame:frame];
}


void hns_view_setNeedsDisplay(HsPtr view, HsBool need)
{
    NSView* pView = (__bridge NSView *)(view);
    [pView setNeedsDisplay:need];
}


HsBool hns_view_inLiveResize(HsPtr view)
{
    NSView* pView = (__bridge NSView *)(view);
    return pView.inLiveResize;
}



HsPtr hns_view_convertPointFromView(HsPtr view, HsDouble x, HsDouble y, HsPtr fromView)
{
    NSView* pView = (__bridge NSView *)(view);
    NSView* pFromView = (__bridge NSView *)(fromView);
    NSPoint point = NSMakePoint(x, y);
    
    static struct HsPoint result;
    NSPoint resPoint = [pView convertPoint:point fromView:pFromView];
    result.x = resPoint.x;
    result.y = resPoint.y;
    return &result;
}


HsPtr hns_view_frame(HsPtr view)
{
    static struct HsRect result;
    NSView* pView = (__bridge NSView *)(view);
    NSRect frame = pView.frame;
    result.x = frame.origin.x;
    result.y = frame.origin.y;
    result.w = frame.size.width;
    result.h = frame.size.height;
    return &result;
}
