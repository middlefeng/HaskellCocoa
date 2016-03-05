

{-# LANGUAGE ForeignFunctionInterface #-}



module Cocoa.AppKit.HNSViewController
(
    HNSViewController
,   HNSViewControllerObj(..)
,   nsViewController_view
)
where



import Foreign
import Cocoa.Runtime.HNSObject
import Cocoa.AppKit.HNSView



class (HNSObject a) => HNSViewController a where

    nsViewController_view :: Ptr a -> IO (Ptr HNSViewObj)
    nsViewController_view = hns_viewController_view




data HNSViewControllerObj = HNSViewControllerObj

instance HNSObject HNSViewControllerObj where
instance HNSViewController HNSViewControllerObj where

    



foreign import ccall hns_viewController_view :: Ptr a -> IO (Ptr b)



