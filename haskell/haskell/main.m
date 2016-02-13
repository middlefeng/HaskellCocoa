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

#include "HNSObject.h"


int main(int argc, const char * argv[])
{
    hs_init(&argc, ((char ***)&argv));
    hns_init();
    
    HsInt x = triple(3);
    printf("Result: %ld.\n", x);
    
    printf("Length of long long. %lu.\n", sizeof(long long));
    
    showTripe(4);
    
    int result = NSApplicationMain(argc, argv);
    hs_exit();
    return result;
}
