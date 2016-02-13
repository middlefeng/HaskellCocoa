//
//  ViewController.m
//  haskell
//
//  Created by dfeng on 2/10/16.
//  Copyright © 2016 dfeng. All rights reserved.
//

#import "ViewController.h"
#import "HaskellExt_stub.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)setRepresentedObject:(id)representedObject
{
    [super setRepresentedObject:representedObject];
}

- (IBAction)showAlert:(id)sender
{
    showAlertHaskell();
}

@end
