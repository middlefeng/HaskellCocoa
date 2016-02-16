# Haskell Cocoa

Hopefully this is going to be a very simple and grow-on-demond Cocoa-Haskell bridge.


## Cocoa Classes

Each class provided by Cocoa (i.e. mostly in AppKit and Foundation framworks) is bridged by three files.
- <code>HNS___.hs</code>
- <code>HNS___.h</code>
- <code>HNS___.m</code>

The Haskell file contains a typeclass named <code>HNS___</code>, that inherits all <code>HNS___</code>s typeclasses that corresponding to the base Cocoa classes which are the parents of <code>NS___</code>. The Haskell file also contains a type named <code>HNS___Obj</code> because Haskell need a kind * type for the return type of most functions.

Bridge functions are implemented as functions in the typeclass <code>HNS___</code>. Each bridge function has the name pattern of: <code>ns[CocoaClasss]\_[CocoaFunction]</code>. The parameters of the <code>ns[CocoaClasss]\_[CocoaFunction]</code> are strong typed, which make them not necessarily marshallable through FFI. For each <code>ns[CocoaClasss]\_[CocoaFunction]</code>, there might be one <code>hns\_[CocoaClass]\_[CocoaFunction]</code> function which is imported from the Objective-C side. Their parameters are weak typed in order to make FFI work. The <code>hns___</code> must be always implemented in Objective-C and never exported from the Haskell module.
