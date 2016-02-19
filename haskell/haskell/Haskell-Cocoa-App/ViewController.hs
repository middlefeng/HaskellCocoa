
{-# LANGUAGE ForeignFunctionInterface #-}




module ViewController where


import Foreign

import Cocoa.Runtime.HNSObject
import Cocoa.Foundation.HNSGeometry

import Cocoa.AppKit.HNSView
import Cocoa.AppKit.HNSViewController
import Cocoa.AppKit.HNSControl
import Cocoa.AppKit.HNSButton
import Cocoa.AppKit.HNSApp
import Cocoa.AppKit.HNSAlert 



foreign import ccall "wrapper" mkFreeFunPtr :: (Ptr HNSButtonObj -> Ptr HNSViewControllerObj -> IO ()) ->
                                                IO (FunPtr (Ptr HNSButtonObj -> Ptr HNSViewControllerObj -> IO ()))



buttonFrame :: Double -> Double ->      -- button size
               HNSRect ->               -- view frame
               HNSRect

buttonFrame btnW btnH (HNSRect _ _ w _) =
                let x' = (w - btnW - 10)
                    y' = 10
                in
                    (HNSRect x' y' btnW btnH)




viewController_testButtonAction :: Ptr HNSButtonObj -> Ptr HNSViewControllerObj -> IO ()

viewController_testButtonAction button _ = 
                            let buttonLabel button' =
                                    nsButton_setTitle button' "Tested" in
                                do
                                    alert <- nsAlertCreate
                                    window <- nsApp_keyWindow
                                    nsAlert_setMessageText alert "Test Alert."
                                    nsAlert_beginSheetModalForWindow alert window (\_ _ -> buttonLabel button)




viewController_loadView :: Ptr HNSViewControllerObj -> IO ()

viewController_loadView viewController =
                                do
                                    view <- nsViewController_view viewController
                                    viewFrame <- nsView_frame view
                                    button <- nsButtonCreate

                                    buttonAction <- mkFreeFunPtr viewController_testButtonAction
                                    nsControl_setAction button buttonAction

                                    nsButton_setBezelStyle button HNSRounded
                                    nsButton_setTitle button "Test Button"
                                    nsView_setFrame button (buttonFrame 100.0 30.0 viewFrame)
                                    nsView_addSubview view button

                                    viewController_setUserButton viewController button
                                    nsRelease button



viewController_viewWillTransitionToSize :: Ptr HNSViewControllerObj -> Double -> Double -> IO ()

viewController_viewWillTransitionToSize viewController h w =
                            let viewFrame = HNSRect 0 0 h w in
                                do
                                    button <- viewController_userButton viewController
                                    nsView_setFrame button viewFrame





viewController_viewLoaded :: Ptr HNSViewControllerObj -> IO ()

viewController_viewLoaded _ = do return ()





foreign import ccall viewController_setUserButton :: Ptr HNSViewControllerObj -> Ptr HNSButtonObj -> IO ()
foreign import ccall viewController_userButton :: Ptr HNSViewControllerObj -> IO (Ptr HNSButtonObj)

foreign export ccall viewController_loadView :: Ptr HNSViewControllerObj -> IO ()
foreign export ccall viewController_viewLoaded :: Ptr HNSViewControllerObj -> IO ()
foreign export ccall viewController_viewWillTransitionToSize :: Ptr HNSViewControllerObj -> Double -> Double -> IO ()


