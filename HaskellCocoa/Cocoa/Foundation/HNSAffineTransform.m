

//
//  NSAffineTransform.m
//
//
//  Created by middleware on 3/12/16.
//
//


#import "HNSAffineTransform.h"
#import "HNSObject.h"


HsPtr hns_AffineTransformCreate()
{
    NSAffineTransform* transform = [NSAffineTransform transform];
    hns_retain(transform);
    return (__bridge HsPtr)transform;
}



void hns_affineTransform_scaleBy(HsPtr transform, HsDouble scale)
{
    NSAffineTransform* pTransform = (__bridge NSAffineTransform*)transform;
    [pTransform scaleBy:scale];
}



void hns_hns_affineTransform_concat(HsPtr transform)
{
    NSAffineTransform* pTransform = (__bridge NSAffineTransform*)transform;
    [pTransform concat];
}

