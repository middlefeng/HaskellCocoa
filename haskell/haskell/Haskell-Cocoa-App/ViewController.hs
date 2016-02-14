
{-# LANGUAGE ForeignFunctionInterface #-}




module ViewController where


import Foreign
import HNSViewController





viewController_loadView :: Ptr HNSViewController -> IO ()

viewController_loadView viewController = do return ()



viewController_viewLoaded :: Ptr HNSViewController -> IO ()

viewController_viewLoaded viewController = do return ()




foreign export ccall viewController_loadView :: Ptr HNSViewController -> IO ()
foreign export ccall viewController_viewLoaded :: Ptr HNSViewController -> IO ()



