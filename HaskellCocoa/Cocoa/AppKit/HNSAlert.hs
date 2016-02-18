


{-# LANGUAGE ForeignFunctionInterface #-}



module Cocoa.AppKit.HNSAlert
(
    HNSAlert
,   HNSAlertObj
,   nsAlertCreate
,   nsAlert_setMessageText
,   nsAlert_beginSheetModalForWindow
)
where


import Foreign
import Foreign.C
import Cocoa.Runtime.HNSObject
import Cocoa.AppKit.HNSApp
import Cocoa.AppKit.HNSWindow


foreign import ccall "wrapper" mkFreeFunPtr :: (Ptr a -> Int64 -> IO ()) ->
                                                IO (FunPtr (Ptr a -> Int64 -> IO ()))


foreign import ccall hns_AlertCreate :: IO (Ptr a)
foreign import ccall hns_alert_setMessageText :: Ptr a -> CString -> IO ()
foreign import ccall hns_alert_beginSheetModalForWindow :: Ptr a -> Ptr w -> FunPtr (Ptr a -> Int64 -> IO ()) -> IO ()


class (HNSObject a) => HNSAlert a where

    nsAlert_setMessageText :: Ptr a -> String -> IO ()
    nsAlert_setMessageText alert message = 
        withCString message (\s -> hns_alert_setMessageText alert s)


    nsAlert_beginSheetModalForWindow :: HNSWindow w => Ptr a -> Ptr w -> (Ptr a -> HNSModalResponse -> IO ()) -> IO ()
    nsAlert_beginSheetModalForWindow alert window completeHandler = do
            let 
                completeHandler' alert' responseCode =
                                                    completeHandler alert' (nsModalResponseFromFFI responseCode)
                
                hns_alert_beginSheetModalForWindow' :: HNSWindow w => Ptr a -> Ptr w -> FunPtr (Ptr a -> Int64 -> IO ()) -> IO ()
                hns_alert_beginSheetModalForWindow' = hns_alert_beginSheetModalForWindow
                
                in do
                    completeHandlerPtr <- mkFreeFunPtr completeHandler'
                    hns_alert_beginSheetModalForWindow' alert window completeHandlerPtr



data HNSAlertObj

instance HNSObject HNSAlertObj where
instance HNSAlert HNSAlertObj where


nsAlertCreate :: IO (Ptr HNSAlertObj)
nsAlertCreate = hns_AlertCreate

