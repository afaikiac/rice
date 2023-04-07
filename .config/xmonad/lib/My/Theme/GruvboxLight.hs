module My.Theme.GruvboxLight
    (
      myFont
    , myTreeFont
    , myNormalBorderColor
    , myFocusedBorderColor
    , myTabTheme
    , myShowWNameTheme
    , myBorderWidth
    )
    where

import XMonad
import XMonad.Layout.Tabbed
import XMonad.Layout.ShowWName

myFont :: String
myFont = "xft:Comfortaa:weight=bold:pixelsize=13:antialias=true:hinting=true"

myTreeFont :: String
myTreeFont = "xft:Comfortaa-16"

colorScheme = "light"

myNormalBorderColor = "#dddddd"
myFocusedBorderColor =  "#ff0000"
myTabActiveColor = "#d79921"
myTabInactiveColor = "#fbf1c7"
myTabActiveBorderColor = "#ff0000"
myTabInactiveBorderColor = "#dddddd"
myTabActiveTextColor = "#32302f"
myTabInactiveTextColor = "#32302f"

myTabTheme =
    def 
        { fontName = myFont
        , activeColor = myTabActiveColor
        , inactiveColor = myTabInactiveColor
        , activeBorderColor = myTabActiveBorderColor
        , inactiveBorderColor = myTabInactiveBorderColor
        , activeTextColor = myTabActiveTextColor 
        , inactiveTextColor = myTabInactiveTextColor
        }

myShowWNameTheme :: SWNConfig
myShowWNameTheme =
    def
        { swn_font = "xft:Ubuntu:bold:size=60"
        , swn_fade = 1.0
        , swn_bgcolor = "#32302f"
        , swn_color = "#fbf1c7"
        }

myBorderWidth :: Dimension
myBorderWidth = 2 -- Sets border width for windows
