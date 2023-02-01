module My.Vars
    (
      myTerminal
    , myBrowser
    , myModMask
    ) where

import XMonad

myTerminal :: String
myTerminal = "alacritty "

myBrowser :: String
myBrowser = "firefox "

myModMask :: KeyMask
myModMask = mod4Mask
