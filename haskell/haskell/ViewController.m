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






