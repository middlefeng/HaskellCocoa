

{-# LANGUAGE ForeignFunctionInterface #-}



module Cocoa.AppKit.HNSView
(
    HNSView
,   HNSViewObj(..)
,   nsViewCreate
,   nsView_addSubview
,   nsView_removeFromSuperview
,   nsView_setFrame
,   nsView_frame
,   nsView_setNeedsDisplay
,   nsView_inLiveResize
,   nsView_convertPointFromView
,   nsView_convertPointFromWindow
)
where


import Foreign
import Cocoa.Runtime.HNSObject
import Cocoa.Foundation.HNSGeometry



class (HNSObject a) => HNSView a where

    nsView_addSubview :: (HNSView b) => Ptr a -> Ptr b -> IO ()
    nsView_addSubview = hns_view_addSubview

    nsView_removeFromSuperview :: Ptr a -> IO ()
    nsView_removeFromSuperview = hns_view_removeFromSuperview

    nsView_setFrame :: Ptr a -> HNSRect -> IO ()
    nsView_setFrame view (HNSRect x y width height) = hns_view_setFrame view x y width height

    nsView_frame :: Ptr a -> IO HNSRect
    nsView_frame view = do
                            rectP <- hns_view_frame view
                            peek rectP

    nsView_setNeedsDisplay :: Ptr a -> Bool -> IO ()
    nsView_setNeedsDisplay = hns_view_setNeedsDisplay

    nsView_inLiveResize :: Ptr a -> IO Bool
    nsView_inLiveResize = hns_view_inLiveResize

    nsView_convertPointFromView :: Ptr a -> HNSPoint -> Ptr a -> IO HNSPoint
    nsView_convertPointFromView view (HNSPoint x y) fromView =
                        do
                            pointPtr <- hns_view_convertPointFromView view x y fromView
                            peek pointPtr

    nsView_convertPointFromWindow :: Ptr a -> HNSPoint -> IO HNSPoint
    nsView_convertPointFromWindow view (HNSPoint x y) =
                        do
                            pointPtr <- hns_view_convertPointFromWindow view x y
                            peek pointPtr





data HNSViewObj = HNSViewObj


instance HNSObject HNSViewObj where

instance HNSView HNSViewObj where


nsViewCreate :: IO (Ptr HNSViewObj)
nsViewCreate = hns_ViewCreate




foreign import ccall hns_ViewCreate :: IO (Ptr HNSViewObj)

foreign import ccall hns_view_addSubview :: Ptr a -> Ptr b -> IO ()
foreign import ccall hns_view_removeFromSuperview :: Ptr a -> IO ()

foreign import ccall hns_view_setFrame :: Ptr a -> Double -> Double -> Double -> Double -> IO ()
foreign import ccall hns_view_frame :: Ptr a -> IO (Ptr HNSRect)

foreign import ccall hns_view_convertPointFromView :: Ptr a -> Double -> Double -> Ptr a -> IO (Ptr HNSPoint)
foreign import ccall hns_view_convertPointFromWindow :: Ptr a -> Double -> Double -> IO (Ptr HNSPoint)
foreign import ccall hns_view_setNeedsDisplay :: Ptr a -> Bool -> IO ()
foreign import ccall hns_view_inLiveResize :: Ptr a -> IO Bool

