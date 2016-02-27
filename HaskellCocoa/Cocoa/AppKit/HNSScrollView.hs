


{-# LANGUAGE ForeignFunctionInterface #-}



module Cocoa.AppKit.HNSScrollView
(
    HNSScrollView
,   HNSScrollViewObj
,   nsScrollViewCreate
)
where


import Foreign
import Cocoa.Runtime.HNSObject
import Cocoa.AppKit.HNSView



foreign import ccall hns_ScrollViewCreate :: IO (Ptr a)


class (HNSView a) => HNSScrollView a where





data HNSScrollViewObj

instance HNSObject HNSScrollViewObj where
instance HNSView HNSScrollViewObj where



nsScrollViewCreate :: IO (Ptr HNSScrollViewObj)
nsScrollViewCreate = hns_ScrollViewCreate

