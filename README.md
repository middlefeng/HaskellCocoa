# Haskell Cocoa

Hopefully this is going to be a very simple and grow-on-demond Cocoa-Haskell bridge.


## Cocoa Classes

Each class provided by Cocoa (i.e. mostly in AppKit and Foundation framworks) is bridged by three files.
- <code>HNS___.hs</code>
- <code>HNS___.h</code>
- <code>HNS___.m</code>

The Haskell file contains a typeclass named <code>HNS___</code>, that inherits all <code>HNS___</code>s typeclasses that corresponding to the base Cocoa classes which are the parents of <code>NS___</code>. The Haskell file also contains a type named <code>HNS___Obj</code> because Haskell need a kind * type for the return type of most functions.

Bridge functions are implemented as functions in the typeclass <code>HNS___</code>. Each bridge function has the name pattern of: <code>ns[CocoaClasss]\_[CocoaFunction]</code>. The parameters of the <code>ns[CocoaClasss]\_[CocoaFunction]</code> are strong typed, which make them not necessarily marshallable through FFI. For each <code>ns[CocoaClasss]\_[CocoaFunction]</code>, there might be one <code>hns\_[CocoaClass]\_[CocoaFunction]</code> function which is imported from the Objective-C side. Their parameters are weak typed in order to make FFI work. The <code>hns___</code> must be always implemented in Objective-C and never exported from the Haskell module.

## App Extension Classes

If an application creates a new Objective-C classes or subclasses a Cocoa class, the Haskell bridge is contained in file:
- <code>___.hs</code>

There is no need to define Haskell data type or typeclass for an application Objective-C class which is not subclassed. It can always be referred in Haskell code by its base class, usually an <code>HNS___Obj</code> type. It remains to see what fits when an application class is subclassed by another.

## Functions Exported from Haskell to Objective-C

Three categories of methods are exported from Haskell to Objective-C.

1. Implementation to a method of an application class.
2. Callback through Cocoa's target-action patter (i.e. through <code>@selector</code>).
3. Callback through C block.

#### Application Class Methond Implementation

Exported as ordinary Haskell methods. Follow the name pattern: <code>[className]_[methodName]</code>.

#### Target-Action

Actions and targets are registered as dynamic Haskell <code>FunPtr</code> and Haskell data. The <code>FunPtr</code> is of type:

<code>(HNS__ a, HNSObject b) => FunPtr (Ptr a -> Ptr b -> IO ())</code>

When the <code>FunPtr</code> and the <code>a</code> appear in the Haskell registration method, they are constraint by typeclass as above. When they appear in the FFI method import, they are not constraint by typeclass in order to make FFI work. When they appear in the definition of the action in Haskell, they are in concrete term type.

A target-action is registered on the Objective-C side with the help of a proxy class, HNS___Delegate. Its <code>@selector(actionFunc:)</code> is used as the actual action, which calls the Haskell exported <code>FunPtr</code>. Its <code>dealloc</code> is responsible for releasing the <code>FunPtr</code> when the action is deregistered.
