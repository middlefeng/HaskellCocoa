//
//  HaskellExt_UI.m
//  haskell
//
//  Created by dfeng on 2/10/16.
//  Copyright © 2016 dfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

#import "HaskellExt_stub.h"


void showAlert()
{
    NSAlert* alert = [[NSAlert alloc] init];
    alert.messageText = @"Test Haskell";
    [alert beginSheetModalForWindow:[NSApp keyWindow] completionHandler:^
     (NSModalResponse returnCode)
     {
         completeHandler();
     }];
}
