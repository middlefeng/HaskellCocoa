
{-# LANGUAGE ForeignFunctionInterface #-}




module ViewController where


import Foreign
import HNSView
import HNSViewController
import HNSButton





viewController_loadView :: Ptr HNSViewControllerObj -> IO ()

viewController_loadView viewController =
                            do
                                view <- nsViewController_view viewController
                                button <- nsButtonCreate
                                nsButton_setTitle button "Test Button"
                                nsView_setFrame button (HNSRect 10 10 100 20)
                                nsView_addSubview view button




viewController_viewLoaded :: Ptr HNSViewControllerObj -> IO ()

viewController_viewLoaded viewController = do return ()




foreign export ccall viewController_loadView :: Ptr HNSViewControllerObj -> IO ()
foreign export ccall viewController_viewLoaded :: Ptr HNSViewControllerObj -> IO ()



