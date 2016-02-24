//
//  AppDelegate.m
//  haskell
//
//  Created by dfeng on 2/10/16.
//  Copyright © 2016 dfeng. All rights reserved.
//

#import "AppDelegate.h"

#import "HsFFI.h"




@interface AppDelegate ()
{
    IBOutlet NSMenuItem* _undo;
    IBOutlet NSMenuItem* _redo;
}


@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
}

- (NSMenuItem*)undo
{
    return _undo;
}

- (NSMenuItem*)redo
{
    return _redo;
}

@end



HsPtr appDelegate_undo(HsPtr delegate)
{
    AppDelegate* pDelegate = (__bridge AppDelegate*)delegate;
    return (__bridge HsPtr)[pDelegate undo];
}


HsPtr appDelegate_redo(HsPtr delegate)
{
    AppDelegate* pDelegate = (__bridge AppDelegate*)delegate;
    return (__bridge HsPtr)[pDelegate redo];
}

