


{-# LANGUAGE ForeignFunctionInterface #-}



module Cocoa.AppKit.HNSBezierPath
(
    HNSBezierPathObj
,   nsBezierPathWithRoundedRect
,   nsBezierPathWithOvalInRect
,   nsBezierPath_strok
,   nsBezierPath_setLineWidth
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



nsBezierPathWithOvalInRect :: HNSRect -> IO (Ptr HNSBezierPathObj)
nsBezierPathWithOvalInRect (HNSRect x y w h) = hns_BezierPathWithOvalInRect x y w h



nsBezierPath_strok :: Ptr HNSBezierPathObj -> IO ()
nsBezierPath_strok = hns_bezierPath_stroke



nsBezierPath_setLineWidth :: Ptr HNSBezierPathObj -> Double -> IO ()
nsBezierPath_setLineWidth = hns_bezierPath_setLineWidth




foreign import ccall hns_BezierPathWithRoundedRect :: Double -> Double -> Double -> Double ->
                                                      Double -> Double ->
                                                      IO (Ptr HNSBezierPathObj)

foreign import ccall hns_BezierPathWithOvalInRect :: Double -> Double -> Double -> Double -> IO (Ptr HNSBezierPathObj)

foreign import ccall hns_bezierPath_stroke :: Ptr HNSBezierPathObj -> IO ()
foreign import ccall hns_bezierPath_setLineWidth :: Ptr HNSBezierPathObj -> Double -> IO ()
