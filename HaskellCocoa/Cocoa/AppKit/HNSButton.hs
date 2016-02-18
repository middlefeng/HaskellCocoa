


{-# LANGUAGE ForeignFunctionInterface #-}



module Cocoa.AppKit.HNSButton
(
    HNSButton
,   HNSButtonObj
,   HNSBezelStyle(..)
,   nsButtonCreate
,   nsButton_setTitle
,   nsButton_setBezelStyle
)
where


import Foreign
import Foreign.C.String
import Cocoa.Runtime.HNSObject
import Cocoa.AppKit.HNSView
import Cocoa.AppKit.HNSControl




data HNSBezelStyle = 
        HNSRounded          |
        HNSRegularSquare    |
        HNSThickSquare      |
        HNSThickerSquare    |
        HNSDisclosure       |
        HNSShadowlessSquare |
        HNSCircular         |
        HNSTexturedSquare   |
        HNSHelpButton       |
        HNSSmallSquare      |
        HNSTexturedRounded  |
        HNSRoundRect        |
        HNSRecessed         |
        HNSRoundedDisclosure |
        HNSInline           |
        HNSSmallIconButton




class (HNSControl a) => HNSButton a where

    nsButton_setTitle :: Ptr a -> String -> IO ()

    nsButton_setTitle button title =
                withCString title (\s -> hns_Button_setTitle button s)


    nsButton_setBezelStyle  :: Ptr a -> HNSBezelStyle -> IO ()

    nsButton_setBezelStyle button style = hns_Button_setBezelStyle button (toFFI style) where
                                        toFFI :: HNSBezelStyle -> Word64
                                        toFFI HNSRounded = 1
                                        toFFI HNSRegularSquare = 2
                                        toFFI HNSThickSquare = 3
                                        toFFI HNSThickerSquare = 4
                                        toFFI HNSDisclosure = 5
                                        toFFI HNSShadowlessSquare = 6
                                        toFFI HNSCircular = 7
                                        toFFI HNSTexturedSquare = 8
                                        toFFI HNSHelpButton = 9
                                        toFFI HNSSmallSquare = 10
                                        toFFI HNSTexturedRounded = 11
                                        toFFI HNSRoundRect = 12
                                        toFFI HNSRecessed = 13
                                        toFFI HNSRoundedDisclosure = 14
                                        toFFI HNSInline = 15
                                        toFFI HNSSmallIconButton = 16




data HNSButtonObj


instance HNSObject HNSButtonObj where
instance HNSView HNSButtonObj where
instance HNSControl HNSButtonObj where
instance HNSButton HNSButtonObj where




nsButtonCreate :: IO (Ptr HNSButtonObj)
nsButtonCreate = hns_ButtonCreate



foreign import ccall hns_ButtonCreate :: IO (Ptr a)
foreign import ccall hns_Button_setTitle :: Ptr a -> CString -> IO ()
foreign import ccall hns_Button_setBezelStyle :: Ptr a -> Word64 -> IO ()




