module My.Theme.Dark where

myFont :: String
myFont = "xft:Ubuntu:weight=bold:pixelsize=13:antialias=true:hinting=true"

myTreeFont :: String
myTreeFont = "xft:Comfortaa-16"

myColorScheme = "dark"

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
