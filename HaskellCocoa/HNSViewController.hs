

{-# LANGUAGE ForeignFunctionInterface #-}



module HNSViewController where



import Foreign
import HNSView



data HNSViewController = HNSViewController




nsViewController_view :: (Ptr HNSViewController) -> IO (Ptr HNSView)



foreign import ccall nsViewController_view :: (Ptr HNSViewController) -> IO (Ptr HNSView)



