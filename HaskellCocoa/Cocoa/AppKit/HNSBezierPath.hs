


{-# LANGUAGE ForeignFunctionInterface #-}



module Cocoa.AppKit.HNSBezierPath
(
    HNSBezierPathObj
,   nsBezierPathWithRoundedRect
,   nsBezierPath_strok
)
where


import Foreign
import Cocoa.Runtime.HNSObject
import Cocoa.Foundation.HNSGeometry



data HNSBezierPathObj

instance HNSObject HNSBezierPathObj where



nsBezierPathWithRoundedRect :: HNSRect -> Double -> Double -> IO (Ptr HNSBezierPathObj)
nsBezierPathWithRoundedRect (HNSRect x y w h) xRadius yRadius =
        hns_BezierPathWithRoundedRect x y w h xRadius yRadius



nsBezierPath_strok :: Ptr HNSBezierPathObj -> IO ()
nsBezierPath_strok = hns_bezierPath_stroke




foreign import ccall hns_BezierPathWithRoundedRect :: Double -> Double -> Double -> Double ->
                                                      Double -> Double ->
                                                      IO (Ptr HNSBezierPathObj)

foreign import ccall hns_bezierPath_stroke :: Ptr HNSBezierPathObj -> IO ()
