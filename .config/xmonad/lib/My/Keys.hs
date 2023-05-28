module My.Keys
    (
      myKeymap
    ) where


import XMonad
import qualified XMonad.StackSet as W

import XMonad.Layout.ResizableTile
import XMonad.Layout.SubLayouts (pullGroup, onGroup, GroupMsg(MergeAll,UnMergeAll, UnMerge))
import XMonad.Layout.WindowNavigation (Direction2D(L, R, U, D), Navigate (Go, Swap))

import XMonad.Actions.WithAll (killAll, sinkAll)
import XMonad.Actions.CopyWindow (kill1)
import XMonad.Actions.Promote (promote)
-- import XMonad.Actions.RotSlaves (rotAllDown, rotSlavesDown)
import qualified XMonad.Layout.MultiToggle as MT (Toggle (..))
import XMonad.Layout.MultiToggle.Instances (StdTransformers (MIRROR, NBFULL, NOBORDERS))

import XMonad.Hooks.ManageDocks (ToggleStruts (..))

import My.Rofi (spawnRofi)
import My.Workspaces (myWorkspacesGreedyView, myWorkspacesShift)
import My.Vars (myTerminal, myBrowser)
import My.Scratchpads
    (
      myTopScratchpadAction
    , myEmulatorScratchpadAction
    -- , myTelegramScratchpadAction
    )

myKeymap :: [(String, X ())]
myKeymap =  
    [ -- KB_GROUP Run Prompt
      ("M-p", spawnRofi "-show drun -show-icons") -- Spawn rofi drun
    , ("M-o", spawnRofi "-show window -show-icons") -- Spawn rofi window

    -- KB_GROUP Useful programs to have a keybinding for launch
    , ("M-<Return>", spawn (myTerminal))
    , ("M-S-<Return>", spawn "alacritty --config-file .config/alacritty/nvim.yml")
    -- , ("M-C-S-l", spawn "xscreensaver-command -lock")
    -- , ("M-b", spawn (myBrowser))
    -- , ("C-g r", spawn (myTerminal ++ "-e lf"))
    , ("C-g f", spawn "pcmanfm")
    -- , ("C-g b", spawn "md.obsidian.Obsidian")
    , ("C-g b", spawn (myBrowser))
    -- , ("C-g t", spawn (myTerminal ++ " -t emulator" ++ " -e tmux new -Asbase"))
    , ("C-g m", spawn "telegram-desktop")
    , ("M-v", spawn ("copyq show"))
    , ("M-`", spawn "microphone-toggle")

    -- KB_GROUP PrtSc
    , ("<Print>", spawn ("screenshot"))
    , ("C-<Print>", spawn ("screenshot shadow"))
    , ("S-<Print>", spawn ("screenshot full"))

    -- KB_GROUP named scratchpads
    , ("M-g", myEmulatorScratchpadAction)
    , ("C-g s", myTopScratchpadAction)
    -- , ("C-g t", myTelegramScratchpadAction)

    -- KB_GROUP Floating windows
    , ("M-t", withFocused $ windows . W.sink) -- Push floating window back to tile
    , ("M-S-t", sinkAll) -- Push ALL floating windows to tile -- Strachpads

    -- KB_GROUP Kill windows
    , ("M-S-c", kill1) -- Kill the currently focused client
    , ("M-S-a", killAll) -- Kill all windows on current workspace

    -- KB_GROUP Tree Select
    , ("M-f", myWorkspacesGreedyView)
    , ("M-S-f", myWorkspacesShift)

    -- KB_GROUP Windows navigation
    , ("M-m", windows W.focusMaster) -- Move focus to the master window
    , ("M-h", sendMessage $ Go L)
    , ("M-j", windows W.focusDown) -- Move focus to the next window
    , ("M-k", windows W.focusUp) -- Move focus to the prev window
    , ("M-l", sendMessage $ Go R)

    , ("M-S-m", windows W.swapMaster) -- Swap the focused window and the master window
    , ("M-S-h", sendMessage $ Swap L)
    , ("M-S-j", windows W.swapDown) -- Swap focused window with next window
    , ("M-S-k", windows W.swapUp) -- Swap focused window with prev window
    , ("M-S-l", sendMessage $ Swap R)

    , ("M-<Backspace>", promote) -- Moves focused window to master, others maintain order
    -- , ("M-S-<Tab>", rotSlavesDown) -- Rotate all windows except master and keep focus in place
    -- , ("M-C-<Tab>", rotAllDown) -- Rotate all the windows in the current stack

    -- KB_GROUP Layouts
    , ("M-<Tab>", sendMessage NextLayout) -- Switch to next layout
    , ("M-<Space>", sendMessage (MT.Toggle NBFULL) >> sendMessage ToggleStruts) -- Toggles noborder/full

    -- KB_GROUP Window resizing
    , ("M-M1-h", sendMessage Shrink) -- Shrink horiz window width
    , ("M-M1-l", sendMessage Expand) -- Expand horiz window width
    , ("M-M1-j", sendMessage MirrorShrink) -- Shrink vert window width
    , ("M-M1-k", sendMessage MirrorExpand) -- Expand vert window width

    -- KB_GROUP Sublayouts
    -- This is used to push windows to tabbed sublayouts, or pull them out of it.
    , ("M-C-h", sendMessage $ pullGroup L)
    , ("M-C-l", sendMessage $ pullGroup R)
    , ("M-C-k", sendMessage $ pullGroup U)
    , ("M-C-j", sendMessage $ pullGroup D)
    , ("M-C-m", withFocused (sendMessage . MergeAll))
    , ("M-C-u", withFocused (sendMessage . UnMerge))
    , ("M-C-/", withFocused (sendMessage . UnMergeAll))
    , ("M-C-.", onGroup W.focusUp') -- Switch focus to next tab
    , ("M-C-,", onGroup W.focusDown') -- Switch focus to prev tab

    -- KB_GROUP Fn Keys
    , ("<XF86AudioPlay>", spawn "playerctl play-pause")
    , ("<XF86AudioNext>", spawn "playerctl next")
    , ("<XF86AudioPrev>", spawn "playerctl previous")
    , ("<XF86AudioMute>", spawn "pactl set-sink-mute 0 toggle")
    , ("<XF86AudioLowerVolume>", spawn "pamixer -ud 3")
    , ("<XF86AudioRaiseVolume>", spawn "pamixer -ui 3")
    , ("<XF86MonBrightnessUp>", spawn "light -A 10")
    , ("<XF86MonBrightnessDown>", spawn "light -U 10")
    -- , ("<XF86Display>", spawn "")
    ]
