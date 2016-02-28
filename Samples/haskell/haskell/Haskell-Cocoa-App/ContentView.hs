
{-# LANGUAGE ForeignFunctionInterface #-}




module ContentView where


import Foreign
import Cocoa.Runtime.HNSObject
import Cocoa.AppKit.HNSView
import Cocoa.AppKit.HNSBezierPath
import Cocoa.Foundation.HNSGeometry

import AppFoundation.HModelUndoRedo

import Model



data ContentViewObj


instance HNSObject ContentViewObj where
instance HNSView ContentViewObj where



contentView_drawRect :: Ptr HNSViewObj -> Double -> Double -> Double -> Double -> IO ()
contentView_drawRect _ _ _ _ _ =
                                appModelQuery showModel where
                                    showModel m =
                                            do
                                                let (MousePos x' y') = historyModelCurrent m
                                                path <- nsBezierPathWithRoundedRect (centerFor x' y' 10) 3 3
                                                nsBezierPath_setLineWidth path 2.0
                                                nsBezierPath_strok path
                                                    where
                                                        centerFor x y w = (HNSRect (x - w / 2.0) (y - w / 2.0) w w)



foreign import ccall contentViewCreate :: IO (Ptr ContentViewObj)
foreign export ccall contentView_drawRect :: Ptr HNSViewObj -> Double -> Double -> Double -> Double -> IO ()
