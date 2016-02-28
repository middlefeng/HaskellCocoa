

{-# LANGUAGE ForeignFunctionInterface #-}



module Cocoa.Foundation.HNSGeometry
(
    HNSRect(..)
,   HNSSize(..)
,   HNSPoint(..)
)
where


import Foreign



data HNSSize = HNSSize Double Double

instance Storable HNSSize where
    alignment _ = 8
    sizeOf _    = 16
    peek ptr    = HNSSize
        <$> peekByteOff ptr 0
        <*> peekByteOff ptr 8
    poke ptr (HNSSize w h) = do
        pokeByteOff ptr 0 w
        pokeByteOff ptr 8 h




data HNSPoint = HNSPoint Double Double

instance Storable HNSPoint where
    alignment _ = 8
    sizeOf _    = 16
    peek ptr    = HNSPoint
        <$> peekByteOff ptr 0
        <*> peekByteOff ptr 8
    poke ptr (HNSPoint x y) = do
        pokeByteOff ptr 0 x
        pokeByteOff ptr 8 y

        


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




