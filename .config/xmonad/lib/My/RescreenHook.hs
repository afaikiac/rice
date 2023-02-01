module My.RescreenHook
  (
    myRescreenHook
  ) where

import XMonad
import XMonad.Hooks.Rescreen (randrChangeHook, rescreenHook)

-- Custom hook for screen (xrandr) configuration changes.
-- https://hackage.haskell.org/package/xmonad-contrib-0.17.0/docs/XMonad-Hooks-Rescreen.html
myRandrChangeHook :: X ()
myRandrChangeHook = do
    spawn "layout-auto"

rescreenCfg =
    def
        { 
          randrChangeHook = myRandrChangeHook
        }

myRescreenHook = rescreenHook rescreenCfg
