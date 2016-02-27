//
//  HNSScrollView.m
//
//
//  Created by middleware on 2/26/16.
//
//

#import <AppKit/AppKit.h>

#import "HNSObject.h"
#import "HNSScrollView.h"


HsPtr hns_ScrollViewCreate(void)
{
    NSScrollView* view = [[NSScrollView alloc] init];
    
    hns_retain(view);
    return (__bridge HsPtr)(view);
}



HsPtr hns_scrollView_contentView(HsPtr view)
{
    NSScrollView* pView = (__bridge NSScrollView*)view;
    return (__bridge HsPtr)pView.contentView;
}


void hns_scrollView_setDocumentView(HsPtr view, HsPtr docView)
{
    NSScrollView* pView = (__bridge NSScrollView*)view;
    NSView* pDocView = (__bridge NSView*)docView;
    [pView setDocumentView:pDocView];
}



void hns_scrollView_setHasHorizontalScroller(HsPtr view, bool b)
{
    NSScrollView* pView = (__bridge NSScrollView*)view;
    [pView setHasHorizontalScroller:b];
}


void hns_scrollView_setHasVerticalScroller(HsPtr view, bool b)
{
    NSScrollView* pView = (__bridge NSScrollView*)view;
    [pView setHasVerticalScroller:b];
}


