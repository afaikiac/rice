module My.Layouts
    (
      myLayoutHook
    ) where

import XMonad
import XMonad.Actions.MouseResize
import XMonad.Hooks.RefocusLast (refocusLastLayoutHook)
import XMonad.Hooks.ManageDocks (avoidStruts)
import XMonad.Layout.LimitWindows (limitWindows)
import XMonad.Layout.MouseResizableTile
import XMonad.Layout.MultiToggle (EOT (EOT), mkToggle, (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers (NBFULL, NOBORDERS))
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.Simplest
import XMonad.Layout.SubLayouts
import XMonad.Layout.TrackFloating
import XMonad.Layout.WindowArranger (windowArrange)
import XMonad.Layout.WindowNavigation
import XMonad.Layout.ResizableTile
import XMonad.Layout.LayoutHints (layoutHintsWithPlacement)
import XMonad.Layout.Tabbed
import My.Theme.Light (myTabTheme)

-- Defining a bunch of layouts.
-- limitWindows n sets maximum number of windows displayed for layout.
tall =
    renamed [Replace "tall"] $
    limitWindows 8 $
    windowNavigation $
    addTabs shrinkText myTabTheme $
    subLayout [] (Simplest) $
    ResizableTall 1 (3 / 100) (1 / 2) []
mirror =
    renamed [Replace "mirror"] $
    limitWindows 6 $
    windowNavigation $
    addTabs shrinkText myTabTheme $
    subLayout [] (Simplest) $
    Mirror (Tall 2 (3 / 100) (3 / 4))
tabs =
    renamed [Replace "tabs"] $
    tabbed shrinkText myTabTheme

-- floats   = renamed [Replace "floats"]
--           --  $ smartBorders
--            $ limitWindows 20 simplestFloat

-- The layout hook
myLayoutHook =
    refocusLastLayoutHook . trackFloating $
    avoidStruts . layoutHintsWithPlacement (0.5, 0.5) . smartBorders $
    -- TODO: What is it doing?
    -- mouseResize $
    -- windowArrange $
    mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout
  where
    myDefaultLayout =
        tall
            ||| mirror
            ||| noBorders tabs
            ||| mouseResizableTile
