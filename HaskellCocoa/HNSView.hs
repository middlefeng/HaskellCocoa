

{-# LANGUAGE ForeignFunctionInterface #-}



module HNSView
(
    HNSView
,   HNSViewObj(..)
,   nsAddSubview
,   nsRemoveFromSuperview
)
where


import Foreign
import HNSObject



class (HNSObject a) => HNSView a where

    nsAddSubview :: Ptr a -> Ptr a -> IO ()
    nsAddSubview = hns_addSubview

    nsRemoveFromSuperview :: Ptr a -> IO ()
    nsRemoveFromSuperview = hns_removeFromSuperview



data HNSViewObj = HNSViewObj


instance HNSObject HNSViewObj where

instance HNSView HNSViewObj where





foreign import ccall hns_addSubview :: Ptr a -> Ptr a -> IO ()
foreign import ccall hns_removeFromSuperview :: Ptr a -> IO ()

