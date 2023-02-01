module My.ManageHook
    (
      myManageHook
    ) where

import XMonad
import Data.Monoid (Endo)
import XMonad.Hooks.ManageHelpers
    (
      doCenterFloat
    , doFullFloat
    , isFullscreen
    )
import My.Scratchpads (myScratchpadManageHook)
import My.Utils (checkDialog)

-- 'doFloat' forces a window to float.  Useful for dialog boxes and such.
-- xprop | grep WM_CLASS
myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook =
    composeAll
        [ checkDialog --> doCenterFloat
        , className =? "confirm" --> doFloat
        , className =? "file_progress" --> doFloat
        , className =? "dialog" --> doFloat
        , className =? "download" --> doFloat
        , className =? "error" --> doFloat
        , className =? "notification" --> doFloat
        , className =? "pinentry-gtk-2" --> doFloat
        , className =? "splash" --> doFloat
        , className =? "toolbar" --> doFloat
        , className =? "Gcr-prompter" --> doFloat
        , className =? "Yad" --> doFloat
        , className =? "copyq" --> doFloat
        , className =? "flameshot" --> doFloat
        , className =? "pentablet" --> doCenterFloat
        , className =? "zoom" --> doFloat
        , appName =? "peek" --> doFloat
        , title =? "Picture-in-Picture" --> doFloat
        , isFullscreen --> doFullFloat
        , title =? "Open Folder" --> doCenterFloat
        , title =? "Oracle VM VirtualBox Manager" --> doFloat
        , className =? "Drawing" --> doFloat
        -- , (className =? "firefox" <&&> resource =? "Dialog") --> doFloat
        -- , (className =? "chromium" <&&> resource =? "Dialog") --> doFloat

        -- Shift apps to defined workspaces.
        -- , className =? "Code" --> doShift " dev "
        -- , title =? "Mozilla Firefox" --> doShift " www "
        -- , className =? "Xournalpp" --> doShift " doc "
        -- , className =? "Notion" --> doShift " doc "
        -- , className =? "notion-app-enhanced" --> doShift " doc "
        -- , className =? "okular" --> doShift " doc "
        -- , className =? "VirtualBox Manager" --> doShift " vbox "
        -- , className =? "TelegramDesktop"          --> doShift " chat "
        -- , className =? "Thunderbird" --> doShift " chat "
        -- , className =? "discord" --> doShift " chat "
        -- , className =? "zoom" --> doShift " chat "
        -- , className =? "vlc" --> doShift " vid "
        -- , className =? "obs" --> doShift " vid "
        -- , className =? "Gimp-2.10" --> doFloat
        -- , className =? "Gimp-2.10" --> doShift " gfx "
        -- , className =? "krita" --> doShift " gfx "
        ]
        <+> myScratchpadManageHook
