

{-# LANGUAGE ForeignFunctionInterface #-}



module Cocoa.AppKit.HNSView
(
    HNSView
,   HNSViewObj(..)
,   HNSRect(..)
,   nsView_addSubview
,   nsView_removeFromSuperview
,   nsView_setFrame
,   nsView_frame
,   nsView_setNeedsDisplay
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
                            (HNSRect x y w h) <- peek rectP
                            return (HNSRect x y w h)

    nsView_setNeedsDisplay :: Ptr a -> Bool -> IO ()
    nsView_setNeedsDisplay = hns_view_setNeedsDisplay




data HNSViewObj = HNSViewObj


instance HNSObject HNSViewObj where

instance HNSView HNSViewObj where





foreign import ccall hns_view_addSubview :: Ptr a -> Ptr b -> IO ()
foreign import ccall hns_view_removeFromSuperview :: Ptr a -> IO ()
foreign import ccall hns_view_setFrame :: Ptr a -> Double -> Double -> Double -> Double -> IO ()
foreign import ccall hns_view_setNeedsDisplay :: Ptr a -> Bool -> IO ()
foreign import ccall hns_view_frame :: Ptr a -> IO (Ptr HNSRect)

