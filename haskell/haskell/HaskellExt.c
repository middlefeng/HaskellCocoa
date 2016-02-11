//
//  HaskellExt.c
//  haskell
//
//  Created by dfeng on 2/10/16.
//  Copyright © 2016 dfeng. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

#include "HaskellExt_stub.h"


HsPtr createPoint(HsInt x)
{
    HsInt* result = malloc(sizeof(HsInt));
    *result = x;
    return result;
}

HsInt triple_p(HsPtr x)
{
    HsInt* i = x;
    return *i * 3;
}

