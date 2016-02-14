//
//  HNSObject.m
//  
//
//  Created by middleware on 2/13/16.
//
//

#import <AppKit/AppKit.h>

#import "HNSView.h"


void hns_addSubview(HsPtr view, HsPtr subview)
{
    NSView* pView = (__bridge NSView *)(view);
    NSView* pSubview = (__bridge NSView *)(subview);
    [pView addSubview:pSubview];
}



void hns_removeFromSuperview(HsPtr view)
{
    NSView* pView = (__bridge NSView *)(view);
    [pView removeFromSuperview];
}


