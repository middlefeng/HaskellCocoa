

{-# LANGUAGE ForeignFunctionInterface #-}



module Cocoa.Foundation.HNSAffineTransform
(
    HNSAffineTransformObj
,   nsAffineTransformCreate
,   nsAffineTransform_scaleBy
,   nsAffineTransform_concat
)
where


import Foreign
import Cocoa.Runtime.HNSObject



data HNSAffineTransformObj


instance HNSObject HNSAffineTransformObj where




nsAffineTransformCreate :: IO (Ptr HNSAffineTransformObj)
nsAffineTransformCreate = hns_AffineTransformCreate


nsAffineTransform_scaleBy :: Ptr HNSAffineTransformObj -> Double -> IO ()
nsAffineTransform_scaleBy = hns_affineTransform_scaleBy


nsAffineTransform_concat :: Ptr HNSAffineTransformObj -> IO ()
nsAffineTransform_concat = hns_hns_affineTransform_concat




foreign import ccall hns_AffineTransformCreate :: IO (Ptr HNSAffineTransformObj)
foreign import ccall hns_affineTransform_scaleBy :: Ptr HNSAffineTransformObj -> Double -> IO ()
foreign import ccall hns_hns_affineTransform_concat :: Ptr HNSAffineTransformObj -> IO ()
