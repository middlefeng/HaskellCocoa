
{-# LANGUAGE ForeignFunctionInterface #-}




module ViewController where


import Foreign
import HNSViewController
import HNSButton





viewController_loadView :: Ptr HNSViewControllerObj -> IO ()

viewController_loadView viewController =
                            do
                                view <- nsViewController_view viewController
                                button <- nsButtonCreate
                                return ()



viewController_viewLoaded :: Ptr HNSViewControllerObj -> IO ()

viewController_viewLoaded viewController = do return ()




foreign export ccall viewController_loadView :: Ptr HNSViewControllerObj -> IO ()
foreign export ccall viewController_viewLoaded :: Ptr HNSViewControllerObj -> IO ()



