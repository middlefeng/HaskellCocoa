//
//  ViewController.m
//  haskell
//
//  Created by dfeng on 2/10/16.
//  Copyright © 2016 dfeng. All rights reserved.
//

#import "ViewController.h"
#import "ViewController_stub.h"



@interface ViewController()

@property (nonatomic, weak) NSButton* userButton;

@end




@implementation ViewController


- (void)loadView
{
    [super loadView];
    viewController_loadView((__bridge HsPtr)(self));
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    viewController_viewLoaded((__bridge HsPtr)(self));
}


- (void)viewWillTransitionToSize:(NSSize)newSize
{
    viewController_viewWillTransitionToSize((__bridge HsPtr)(self),
                                            newSize.width, newSize.height);
}


- (void)setRepresentedObject:(id)representedObject
{
    [super setRepresentedObject:representedObject];
}


@end


void viewController_setUserButton(HsPtr viewController, HsPtr button)
{
    ViewController* pViewController = (__bridge ViewController*)viewController;
    NSButton* pButton = (__bridge NSButton*)button;
    pViewController.userButton = pButton;
}


HsPtr viewController_userButton(HsPtr viewController)
{
    ViewController* pViewController = (__bridge ViewController*)viewController;
    return (__bridge HsPtr)pViewController.userButton;
}




