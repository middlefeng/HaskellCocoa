
{-# LANGUAGE ForeignFunctionInterface #-}




module ContentView where


import Foreign
import Cocoa.Runtime.HNSObject
import Cocoa.AppKit.HNSApp
import Cocoa.AppKit.HNSView
import Cocoa.AppKit.HNSMenuItem
import Cocoa.AppKit.HNSBezierPath
import Cocoa.Foundation.HNSGeometry

import AppFoundation.HModelUndoRedo

import Model
import AppDelegate




foreign import ccall "wrapper" mkMenuItemAction :: (Ptr HNSMenuItemObj -> Ptr HNSViewObj -> IO ()) ->
                                                    IO (FunPtr (Ptr HNSMenuItemObj -> Ptr HNSViewObj -> IO ()))



appDelegate :: IO (Ptr AppDelegate)
appDelegate = nsApp_delegate



menuUndo :: HNSMenuItem a => Ptr a -> Ptr HNSViewObj -> IO ()
menuUndo _ view = 
        do
            appModelUpdate appModelUndo
            nsView_setNeedsDisplay view True


menuRedo :: HNSMenuItem a => Ptr a -> Ptr HNSViewObj -> IO ()
menuRedo _ view =
        do
            appModelUpdate appModelRedo
            nsView_setNeedsDisplay view True



updateUndoRedo :: AppModel -> Ptr HNSViewObj -> IO ()
updateUndoRedo m view =
                        do
                            delegate <- appDelegate
                            undoMenu <- appDelegate_undo delegate
                            redoMenu <- appDelegate_redo delegate

                            if (modelCanUndo m)
                                then
                                    do
                                        menuUndoAction <- mkMenuItemAction menuUndo
                                        nsMenuItem_setAction undoMenu view menuUndoAction
                                else
                                    do
                                        nsMenuItem_removeAction undoMenu

                            if (modelCanRedo m)
                                then
                                    do
                                        menuRedoAction <- mkMenuItemAction menuRedo
                                        nsMenuItem_setAction redoMenu view menuRedoAction
                                else 
                                    do
                                        nsMenuItem_removeAction redoMenu











data ContentViewObj


instance HNSObject ContentViewObj where
instance HNSView ContentViewObj where



contentView_drawRect :: Ptr HNSViewObj -> Double -> Double -> Double -> Double -> IO ()
contentView_drawRect view _ _ _ _ =
                                appModelQuery showModel where
                                    showModel m =
                                            do
                                                let (MousePos x' y') = historyModelCurrent m
                                                path <- nsBezierPathWithRoundedRect (centerFor x' y' 10) 3 3
                                                nsBezierPath_setLineWidth path 2.0
                                                nsBezierPath_strok path

                                                updateUndoRedo m view

                                                    where
                                                        centerFor x y w = (HNSRect (x - w / 2.0) (y - w / 2.0) w w)



contentView_mouseDown :: Ptr HNSViewObj -> Double -> Double -> IO ()

contentView_mouseDown view x y =
                do
                    (HNSPoint x' y') <- nsView_convertPointFromWindow view (HNSPoint x y)

                    appModelUpdate (\m -> modelAppend m (MousePos x' y'))
                    nsView_setNeedsDisplay view True
                    



foreign import ccall contentViewCreate :: IO (Ptr ContentViewObj)
foreign export ccall contentView_drawRect :: Ptr HNSViewObj -> Double -> Double -> Double -> Double -> IO ()
foreign export ccall contentView_mouseDown :: Ptr HNSViewObj -> Double -> Double -> IO ()


