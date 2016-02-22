


{-# LANGUAGE ForeignFunctionInterface #-}



module Cocoa.AppKit.HNSApp
(
    nsApp_keyWindow
,   HNSModalResponse(..)
,   nsModalResponseToFFI
,   nsModalResponseFromFFI
)
where


import Foreign
import Cocoa.AppKit.HNSWindow



foreign import ccall hns_app_keyWindow :: IO (Ptr a)




data HNSModalResponse = Stop | Abort | Continue


nsModalResponseToFFI :: HNSModalResponse -> Int64

nsModalResponseToFFI Stop = -1000
nsModalResponseToFFI Abort = -1001
nsModalResponseToFFI Continue = -1002



nsModalResponseFromFFI :: Int64 -> HNSModalResponse

nsModalResponseFromFFI (-1000) = Stop
nsModalResponseFromFFI (-1001) = Abort
nsModalResponseFromFFI (-1002) = Continue
nsModalResponseFromFFI _ = Stop




nsApp_keyWindow :: IO (Ptr HNSWindowObj)
nsApp_keyWindow = hns_app_keyWindow
