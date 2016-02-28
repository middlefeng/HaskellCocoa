


{-# LANGUAGE ForeignFunctionInterface #-}



module Cocoa.AppKit.HNSScrollView
(
    HNSScrollView
,   HNSScrollViewObj
,   nsScrollViewCreate
,   nsSCrollView_contentView
,   nsScrollView_setDocumentView
,   nsScrollView_documentView
,   nsScrollView_setHasHorizontalScroller
,   nsScrollView_setHasVerticalScroller
)
where


import Foreign
import Cocoa.Runtime.HNSObject
import Cocoa.AppKit.HNSView



foreign import ccall hns_ScrollViewCreate :: IO (Ptr a)
foreign import ccall hns_scrollView_contentView :: Ptr a -> IO (Ptr b)
foreign import ccall hns_scrollView_setDocumentView :: Ptr a -> Ptr b -> IO ()
foreign import ccall hns_scrollView_documentView :: Ptr a -> IO (Ptr b)

foreign import ccall hns_scrollView_setHasHorizontalScroller :: Ptr a -> Bool -> IO ()
foreign import ccall hns_scrollView_setHasVerticalScroller :: Ptr a -> Bool -> IO ()




class (HNSView a) => HNSScrollView a where

    nsSCrollView_contentView :: HNSView b => Ptr a -> IO (Ptr b)
    nsSCrollView_contentView = hns_scrollView_contentView

    nsScrollView_setDocumentView :: HNSView b =>  Ptr a -> Ptr b -> IO ()
    nsScrollView_setDocumentView = hns_scrollView_setDocumentView

    nsScrollView_documentView :: HNSView b => Ptr a -> IO (Ptr b)
    nsScrollView_documentView = hns_scrollView_documentView

    nsScrollView_setHasHorizontalScroller :: Ptr a -> Bool -> IO ()
    nsScrollView_setHasHorizontalScroller = hns_scrollView_setHasHorizontalScroller

    nsScrollView_setHasVerticalScroller :: Ptr a -> Bool -> IO ()
    nsScrollView_setHasVerticalScroller = hns_scrollView_setHasVerticalScroller





data HNSScrollViewObj

instance HNSObject HNSScrollViewObj where
instance HNSView HNSScrollViewObj where
instance HNSScrollView HNSScrollViewObj where



nsScrollViewCreate :: IO (Ptr HNSScrollViewObj)
nsScrollViewCreate = hns_ScrollViewCreate

