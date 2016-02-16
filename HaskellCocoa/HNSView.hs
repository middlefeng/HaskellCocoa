

{-# LANGUAGE ForeignFunctionInterface #-}



module HNSView
(
    HNSView
,   HNSViewObj(..)
,   HNSRect(..)
,   nsView_addSubview
,   nsView_removeFromSuperview
,   nsView_setFrame
)
where


import Foreign
import HNSObject



data HNSRect = HNSRect Double Double Double Double



class (HNSObject a) => HNSView a where

    nsView_addSubview :: (HNSView b) => Ptr a -> Ptr b -> IO ()
    nsView_addSubview = hns_view_addSubview

    nsView_removeFromSuperview :: Ptr a -> IO ()
    nsView_removeFromSuperview = hns_view_removeFromSuperview

    nsView_setFrame :: Ptr a -> HNSRect -> IO ()
    nsView_setFrame view (HNSRect x y width height) = hns_view_setFrame view x y width height



data HNSViewObj = HNSViewObj


instance HNSObject HNSViewObj where

instance HNSView HNSViewObj where





foreign import ccall hns_view_addSubview :: Ptr a -> Ptr b -> IO ()
foreign import ccall hns_view_removeFromSuperview :: Ptr a -> IO ()
foreign import ccall hns_view_setFrame :: Ptr a -> Double -> Double -> Double -> Double -> IO ()

