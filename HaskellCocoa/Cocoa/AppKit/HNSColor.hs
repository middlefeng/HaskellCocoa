


{-# LANGUAGE ForeignFunctionInterface #-}



module Cocoa.AppKit.HNSColor
(
    HNSColorObj
,   nsColorCreate
,   nsColor_set
)
where


import Foreign
import Cocoa.Runtime.HNSObject




data HNSColorObj


instance HNSObject HNSColorObj where



nsColorCreate :: Double -> Double -> Double -> Double -> IO (Ptr HNSColorObj)
nsColorCreate = hns_ColorCreate



nsColor_set :: Ptr HNSColorObj -> IO ()
nsColor_set = hns_color_set



foreign import ccall hns_ColorCreate :: Double -> Double -> Double -> Double -> IO (Ptr HNSColorObj)
foreign import ccall hns_color_set :: Ptr HNSColorObj -> IO ()



