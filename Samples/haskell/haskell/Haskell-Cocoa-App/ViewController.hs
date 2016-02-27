
{-# LANGUAGE ForeignFunctionInterface #-}




module ViewController where


import Foreign

import Cocoa.Runtime.HNSObject
import Cocoa.Foundation.HNSGeometry

import Cocoa.AppKit.HNSView
import Cocoa.AppKit.HNSScrollView
import Cocoa.AppKit.HNSViewController
import Cocoa.AppKit.HNSControl
import Cocoa.AppKit.HNSButton
import Cocoa.AppKit.HNSApp
import Cocoa.AppKit.HNSAlert 

import AppFoundation.HModelUndoRedo
import View
import Model



foreign import ccall "wrapper" mkFreeFunPtr :: (Ptr HNSButtonObj -> Ptr HNSViewControllerObj -> IO ()) ->
                                                IO (FunPtr (Ptr HNSButtonObj -> Ptr HNSViewControllerObj -> IO ()))




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
                                    appModelInit (modelHistoryStart (MousePos 0 0))
                                    
                                    viewController_loadViewButtons viewController
                                    viewController_loadViewScrollableContent viewController




viewController_loadViewButtons :: Ptr HNSViewControllerObj -> IO ()

viewController_loadViewButtons viewController =
                                do
                                    view <- nsViewController_view viewController
                                    viewFrame <- nsView_frame view
                                    button <- nsButtonCreate

                                    buttonAction <- mkFreeFunPtr viewController_testButtonAction
                                    nsControl_setAction button viewController buttonAction

                                    nsButton_setBezelStyle button HNSRounded
                                    nsButton_setTitle button "Test Button"
                                    nsView_setFrame button (buttonFrame 100.0 30.0 viewFrame)
                                    nsView_addSubview view button

                                    view_setUserButton view button
                                    nsRelease button



viewController_loadViewScrollableContent :: Ptr HNSViewControllerObj -> IO ()

viewController_loadViewScrollableContent viewController =
                                do
                                    scrollView <- nsScrollViewCreate
                                    nsScrollView_setHasHorizontalScroller scrollView True
                                    nsScrollView_setHasVerticalScroller scrollView True
                                  
                                    view <- nsViewController_view viewController  
                                    (HNSRect _ _ w h) <- nsView_frame view
                                    nsView_setFrame scrollView (scrollViewFrame w h)
                                    nsView_addSubview view scrollView

                                    docView <- nsViewCreate
                                    nsScrollView_setDocumentView scrollView docView
                                    nsView_setFrame docView (HNSRect 0 0 800 800)
                                    nsRelease docView

                                    view_setScrollView view scrollView
                                    nsRelease scrollView






viewController_viewWillTransitionToSize :: Ptr HNSViewControllerObj -> Double -> Double -> IO ()

viewController_viewWillTransitionToSize viewController h w =
                            let viewFrame = HNSRect 0 0 h w in
                                do
                                    view <- nsViewController_view viewController
                                    button <- view_userButton view
                                    nsView_setFrame button viewFrame





viewController_viewLoaded :: Ptr HNSViewControllerObj -> IO ()

viewController_viewLoaded _ = do return ()





foreign export ccall viewController_loadView :: Ptr HNSViewControllerObj -> IO ()
foreign export ccall viewController_viewLoaded :: Ptr HNSViewControllerObj -> IO ()
foreign export ccall viewController_viewWillTransitionToSize :: Ptr HNSViewControllerObj -> Double -> Double -> IO ()


