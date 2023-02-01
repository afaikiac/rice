module My.Rofi (spawnRofi) where

import Data.List (elemIndex)
import XMonad
import XMonad.Actions.PhysicalScreens
import qualified XMonad.StackSet as W

-- Get focused screeen to spawm Rofi
reverseList :: [Int] -> [Int]
reverseList [] = []
reverseList (x : xs) = reverseList xs ++ [x]

physicalScreens :: X [Maybe ScreenId]
physicalScreens = withWindowSet $ \windowSet -> do
    let numScreens = length $ W.screens windowSet
    let reverseDisplayIdList = reverseList [0 .. numScreens - 1]
    mapM (getScreen def . P) reverseDisplayIdList

-- mapM (\s -> getScreen def (P s)) [0..numScreens] -- #feature

-- If this function seems weird, it's because it's intended to be dual to
--   getScreen :: PhysicalScreen -> X (Maybe ScreenId)
-- from XMonad.Actions.PhysicalScreens.
-- See: https://hackage.haskell.org/package/xmonad-contrib-0.13/docs/XMonad-Actions-PhysicalScreens.html
getPhysicalScreen :: ScreenId -> X (Maybe PhysicalScreen)
getPhysicalScreen sid = do
    pscreens <- physicalScreens
    return $ (Just sid) `elemIndex` pscreens >>= \s -> Just (P s)

rofi :: X String
rofi = withWindowSet $ \windowSet -> do
    let sid = W.screen (W.current windowSet)
    pscreen <- getPhysicalScreen sid
    return $ case pscreen of
        Just (P s) -> "rofi -m " ++ (show s)
        otherwise -> "rofi"

spawnRofi :: String -> X ()
spawnRofi args = do
    cmd <- rofi
    spawn $ cmd ++ " " ++ args

