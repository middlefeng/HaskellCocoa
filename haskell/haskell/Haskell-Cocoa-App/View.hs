
{-# LANGUAGE ForeignFunctionInterface #-}




module View where


import Foreign

import Cocoa.Foundation.HNSGeometry
import Cocoa.Runtime.HNSObject

import Cocoa.AppKit.HNSApp
import Cocoa.AppKit.HNSView
import Cocoa.AppKit.HNSButton
import Cocoa.AppKit.HNSColor
import Cocoa.AppKit.HNSBezierPath
import Cocoa.AppKit.HNSMenuItem

import Model
import AppDelegate



buttonFrame :: Double -> Double ->      -- button size
               HNSRect ->               -- view frame
               HNSRect

buttonFrame btnW btnH (HNSRect _ _ w _) =
                let x' = (w - btnW - 10)
                    y' = 10
                in
                    (HNSRect x' y' btnW btnH)




foreign import ccall "wrapper" mkMenuItemAction :: (Ptr HNSMenuItemObj -> IO ()) ->
                                                    IO (FunPtr (Ptr HNSMenuItemObj -> IO ()))



appDelegate :: IO (Ptr AppDelegate)
appDelegate = nsApp_delegate



menuUndo :: HNSMenuItem a => Ptr a -> IO ()
menuUndo _ = appModelUpdate appModelUndo


menuRedo :: HNSMenuItem a => Ptr a -> IO ()
menuRedo _ = appModelUpdate appModelRedo


canUndo (AppModel _ Nothing _) = False
canUndo _ = True


canRedo (AppModel _ _ Nothing) = False
canRedo _ = True



updateUndoRedo :: AppModel -> IO ()
updateUndoRedo m =
                        do
                            delegate <- appDelegate
                            undoMenu <- appDelegate_undo delegate
                            redoMenu <- appDelegate_redo delegate

                            if (canUndo m)
                                then
                                    do
                                        menuUndoAction <- mkMenuItemAction menuUndo
                                        nsMenuItem_setAction undoMenu menuUndoAction
                                else
                                    do
                                        nsMenuItem_removeAction redoMenu

                            if (canRedo m)
                                then
                                    do
                                        menuRedoAction <- mkMenuItemAction menuRedo
                                        nsMenuItem_setAction redoMenu menuRedoAction
                                else 
                                    do
                                        nsMenuItem_removeAction redoMenu







view_drawRect :: Ptr HNSViewObj -> Double -> Double -> Double -> Double -> IO ()

view_drawRect view _ _ _ _ = 
                        let inSet :: HNSRect -> Double -> HNSRect
                            inSet (HNSRect x' y' w' h') i = (HNSRect (x' + i) (y' + i) (w' - i * 2.0) (h' - i * 2.0))

                            center (HNSRect x' y' w' h') = (x' + w' / 2.0, y' + h' / 2.0) in

                            do
                                viewFrame <- nsView_frame view
                                button <- view_userButton view
                                nsView_setFrame button (buttonFrame 100.0 30.0 viewFrame)

                                color <- nsColorCreate 0.2 0.2 0.2 1.0
                                nsColor_set color
                                path <- nsBezierPathWithRoundedRect (inSet viewFrame 20) 5 5
                                nsBezierPath_setLineWidth path 3.0
                                nsBezierPath_strok path

                                {-
                                liveResize <- nsView_inLiveResize view
                                if liveResize
                                    then
                                        do
                                            let f _ = (AppModel (MousePos cx cy)) where (cx, cy) = center viewFrame
                                            appModelUpdate f
                                    else
                                        appModelUpdate id
                                -}
                                
                                appModelQuery showModel where
                                    showModel m@(AppModel (MousePos x' y') prev next) =
                                            do
                                                path <- nsBezierPathWithRoundedRect (centerFor x' y' 10) 3 3
                                                nsBezierPath_setLineWidth path 2.0
                                                nsBezierPath_strok path
                                                updateUndoRedo m
                                                    where
                                                        centerFor x y w = (HNSRect (x - w / 2.0) (y - w / 2.0) w w)







view_mouseDown :: Ptr HNSViewObj -> Double -> Double -> IO ()

view_mouseDown view x y =
                let f m = (AppModel (MousePos x y) (Just m) Nothing) in
                    do appModelUpdate f
                       nsView_setNeedsDisplay view True




foreign import ccall view_setUserButton :: Ptr HNSViewObj -> Ptr HNSButtonObj -> IO ()
foreign import ccall view_userButton :: Ptr HNSViewObj -> IO (Ptr HNSButtonObj)

foreign export ccall view_drawRect :: Ptr HNSViewObj -> Double -> Double -> Double -> Double -> IO ()
foreign export ccall view_mouseDown :: Ptr HNSViewObj -> Double -> Double -> IO ()

