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


