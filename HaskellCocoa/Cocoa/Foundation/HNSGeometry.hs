

{-# LANGUAGE ForeignFunctionInterface #-}



module Cocoa.Foundation.HNSGeometry
(
    HNSRect(..)
)
where


import Foreign



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




