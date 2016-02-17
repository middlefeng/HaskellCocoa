
{-# LANGUAGE ForeignFunctionInterface #-}




module ViewController where


import Foreign
import Cocoa.AppKit.HNSView
import Cocoa.AppKit.HNSViewController
import Cocoa.AppKit.HNSButton





viewController_loadView :: Ptr HNSViewControllerObj -> IO ()

viewController_loadView viewController =
                            let buttonFrame :: Double -> Double -> HNSRect -> HNSRect
                                buttonFrame btnW btnH (HNSRect _ _ w h) =
                                                let x' = (w - btnW) / 2.0
                                                    y' = (h - btnH) / 2.0
                                                in
                                                    (HNSRect x' y' btnW btnH) in
                                do
                                    view <- nsViewController_view viewController
                                    viewFrame <- nsView_frame view
                                    button <- nsButtonCreate
                                    nsButton_setTitle button "Test Button"
                                    nsView_setFrame button (buttonFrame 100.0 30.0 viewFrame)
                                    nsView_addSubview view button




viewController_viewLoaded :: Ptr HNSViewControllerObj -> IO ()

viewController_viewLoaded _ = do return ()




foreign export ccall viewController_loadView :: Ptr HNSViewControllerObj -> IO ()
foreign export ccall viewController_viewLoaded :: Ptr HNSViewControllerObj -> IO ()



