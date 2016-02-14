

{-# LANGUAGE ForeignFunctionInterface #-}



module HNSViewController
(
    HNSViewController
,   HNSViewControllerObj(..)
,   nsViewController_view
)
where



import Foreign
import HNSObject
import HNSView



class (HNSObject a) => HNSViewController a where

    nsViewController_view :: Ptr a -> IO (Ptr HNSViewObj)


data HNSViewControllerObj = HNSViewControllerObj

instance HNSObject HNSViewControllerObj where

instance HNSViewController HNSViewControllerObj where

    nsViewController_view = hns_viewController_view



foreign import ccall hns_viewController_view :: Ptr a -> IO (Ptr b)



