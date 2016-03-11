
{-# LANGUAGE ForeignFunctionInterface #-}




module ViewController where


import Foreign

import Cocoa.Runtime.HNSObject
import Cocoa.AppKit.HNSViewController

import View







data ViewControllerObj



instance HNSViewController ViewControllerObj where
instance HNSObject ViewControllerObj where





viewController_loadView :: Ptr ViewControllerObj -> IO ()

viewController_loadView viewController =
    do
        nsView <- nsViewController_view viewController
        let view = castPtr nsView :: Ptr ViewObj
        view_addProgram view





viewController_viewWillTransitionToSize :: Ptr ViewControllerObj -> Double -> Double -> IO ()

viewController_viewWillTransitionToSize _ _ _ = do return ()





viewController_viewLoaded :: Ptr ViewControllerObj -> IO ()

viewController_viewLoaded _ = do return ()





foreign export ccall viewController_loadView :: Ptr ViewControllerObj -> IO ()
foreign export ccall viewController_viewLoaded :: Ptr ViewControllerObj -> IO ()
foreign export ccall viewController_viewWillTransitionToSize :: Ptr ViewControllerObj -> Double -> Double -> IO ()


