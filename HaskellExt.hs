
{-# LANGUAGE ForeignFunctionInterface #-}


module HaskellExt where


triple :: Int -> Int

triple x = x * 3



foreign export ccall triple :: Int -> Int
