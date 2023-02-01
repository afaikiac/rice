module My.Utils 
    (
      checkDialog
    ) where

import XMonad

-- https://wiki.haskell.org/Xmonad/Config_archive/Mntnoe%27s_xmonad.hs

{- | Helper to read a property
 getProp :: Atom -> Window -> X (Maybe [CLong])
-}
getProp a w = withDisplay $ \dpy -> io $ getWindowProperty32 dpy a w

-- | Check if window is DIALOG window
checkDialog :: Query Bool
checkDialog =
    ask >>= \w -> liftX $ do
        a <- getAtom "_NET_WM_WINDOW_TYPE"
        dialog <- getAtom "_NET_WM_WINDOW_TYPE_DIALOG"
        mbr <- getProp a w
        case mbr of
            Just [r] -> return $ elem (fromIntegral r) [dialog]
            _ -> return False
