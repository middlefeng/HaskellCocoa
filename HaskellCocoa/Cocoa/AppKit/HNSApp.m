//
//  HNSObject.m
//  
//
//  Created by middleware on 2/13/16.
//
//

#import <AppKit/AppKit.h>

#import "HNSApp.h"


HsPtr hns_app_keyWindow(void)
{
    NSWindow* window = [NSApp keyWindow];
    return (__bridge HsPtr)(window);
}



