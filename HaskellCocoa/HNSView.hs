

{-# LANGUAGE ForeignFunctionInterface #-}



module HNSView
(
    HNSView
,   HNSViewObj(..)
,   HNSRect(..)
,   nsView_addSubview
,   nsView_removeFromSuperview
,   nsView_setFrame
,   nsView_frame
)
where


import Foreign
import HNSObject



data HNSRect = HNSRect Double Double Double Double

instance Storable HNSRect where
    alignment _ = 8
    sizeOf _    = 32
    peek ptr    = HNSRect
        <$> peekByteOff ptr 0
        <*> peekByteOff ptr 8
        <*> peekByteOff ptr 16
        <*> peekByteOff ptr 24
    poke ptr (HNSRect x y w h) = do
        pokeByteOff ptr 0 x
        pokeByteOff ptr 8 y
        pokeByteOff ptr 16 w
        pokeByteOff ptr 24 h



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




data HNSViewObj = HNSViewObj


instance HNSObject HNSViewObj where

instance HNSView HNSViewObj where





foreign import ccall hns_view_addSubview :: Ptr a -> Ptr b -> IO ()
foreign import ccall hns_view_removeFromSuperview :: Ptr a -> IO ()
foreign import ccall hns_view_setFrame :: Ptr a -> Double -> Double -> Double -> Double -> IO ()
foreign import ccall hns_view_frame :: Ptr a -> IO (Ptr HNSRect)

