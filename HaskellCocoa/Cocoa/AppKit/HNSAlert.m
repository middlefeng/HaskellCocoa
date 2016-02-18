//
//  HNSObject.m
//  
//
//  Created by middleware on 2/13/16.
//
//

#import <AppKit/AppKit.h>

#import "HNSAlert.h"


HsPtr hns_AlertCreate(void)
{
    NSAlert* alert = [[NSAlert alloc] init];
    return (__bridge HsPtr)(alert);
}



void hns_alert_setMessageText(HsPtr alert, char* text)
{
    NSAlert* pAlert = (__bridge NSAlert*)alert;
    [pAlert setMessageText:[NSString stringWithUTF8String:text]];
}



typedef void (*CompleteHandler_t)(HsPtr alert, HsInt8 returnCode);


void hns_alert_beginSheetModalForWindow(HsPtr alert, HsPtr window, HsFunPtr completeHandler)
{
    NSAlert* pAlert = (__bridge NSAlert*)alert;
    NSWindow* pWindow = (__bridge NSWindow*)window;
    CompleteHandler_t pHandler = (CompleteHandler_t)completeHandler;
    
    [pAlert beginSheetModalForWindow:pWindow completionHandler:^(NSModalResponse returnCode)
                 {
                     pHandler(alert, returnCode);
                 }];
}

