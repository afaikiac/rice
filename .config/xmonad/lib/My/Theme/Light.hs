module My.Theme.Light
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

myNormalBorderColor = "#000000"
myFocusedBorderColor =  "#cb4b16"
myTabActiveColor = "#cb4b16"
myTabInactiveColor = "#fdf6e3"
myTabActiveBorderColor = "#cb4b16"
myTabInactiveBorderColor = "#000000"
myTabActiveTextColor = "#fdf6e3"
myTabInactiveTextColor = "#000000"

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
        , swn_bgcolor = "#1c1f24"
        , swn_color = "#ffffff"
        }

myBorderWidth :: Dimension
myBorderWidth = 2 -- Sets border width for windows
