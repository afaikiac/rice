import XMonad
import XMonad.Hooks.EwmhDesktops (ewmh) -- for some fullscreen events, also for xcomposite in obs.
import XMonad.Hooks.ManageDocks (docks, manageDocks)
import XMonad.Hooks.SetWMName (setWMName)
import XMonad.Hooks.WorkspaceHistory (workspaceHistoryHook)
import XMonad.Layout.Fullscreen 
    (
      fullscreenEventHook
    , fullscreenManageHook
    )
import XMonad.Layout.ShowWName (showWName')
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.SpawnOnce (spawnOnce)

import My.Theme.Light
    (
      myShowWNameTheme
    , myNormalBorderColor
    , myFocusedBorderColor
    , myBorderWidth
    )
import My.Workspaces (myWorkspacesList)
import My.Vars 
    (
      myTerminal
    , myBrowser
    , myModMask
    )
import My.Layouts (myLayoutHook)
import My.Keys (myKeymap)
import My.ManageHook
import My.RescreenHook


myStartupHook :: X ()
myStartupHook = do
    -- spawn ("wallpaper " ++ myColorScheme ++ "-solid")
    spawnOnce "picom --config $HOME/.config/picom/picom.conf"
    setWMName "LG3D"


main :: IO ()
main = do
    xmonad $
        docks $
        myRescreenHook $
        -- ewmhFullscreen $
        ewmh $
        def
            { -- https://hackage.haskell.org/package/xmonad-contrib-0.17.0/docs/XMonad-Layout-Fullscreen.html
              handleEventHook = fullscreenEventHook
            , layoutHook = showWName' myShowWNameTheme $ myLayoutHook
            , manageHook = myManageHook <+> manageDocks <+> fullscreenManageHook
            , logHook = workspaceHistoryHook
            , modMask = myModMask
            , terminal = myTerminal
            , startupHook = myStartupHook
            , workspaces = myWorkspacesList
            , borderWidth = myBorderWidth
            , normalBorderColor = myNormalBorderColor
            , focusedBorderColor = myFocusedBorderColor
            }
            `additionalKeysP` myKeymap
