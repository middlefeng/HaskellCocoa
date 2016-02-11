//
//  main.m
//  haskell
//
//  Created by dfeng on 2/10/16.
//  Copyright © 2016 dfeng. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#include "HsFFI.h"
#include "HaskellExt_stub.h"

int main(int argc, const char * argv[])
{
    hs_init(&argc, ((char ***)&argv));
    
    HsInt x = triple(3);
    printf("Result: %ld.\n", x);
    
    int result = NSApplicationMain(argc, argv);
    hs_exit();
    return result;
}
