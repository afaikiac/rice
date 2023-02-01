module My.Scratchpads
    (
      myScratchpadManageHook
    , myEmulatorScratchpadAction
    , myTopScratchpadAction
    , myTelegramScratchpadAction
    ) where

import XMonad.StackSet as W
import XMonad.ManageHook
import XMonad.Util.NamedScratchpad

import My.Vars (myTerminal)

myScratchpadManageHook = namedScratchpadManageHook myScratchPads
myEmulatorScratchpadAction = namedScratchpadAction myScratchPads "emulator" 
myTopScratchpadAction = namedScratchpadAction myScratchPads "top" 
myTelegramScratchpadAction = namedScratchpadAction myScratchPads "telegram" 

-- interesting https://github.com/gvolpe/nix-config/blob/6f9dbfe73020774a8fe6c5ba0bf9a15157e89019/home/programs/xmonad/config.hs#L461
myScratchPads :: [NamedScratchpad]
myScratchPads =
    [ NS "emulator" spawnTerm findTerm manageTerm
    , NS "top" spawnTop findTop manageTop
    , NS "telegram" spawnTelegram findTelegram manageTelegram
    -- , NS "calculator" spawnCalc findCalc manageCalc
    ]
  where
    spawnTerm = myTerminal ++ " -t emulator" ++ " -e tmux new -As\"(づ ᴗ _ᴗ)づ\""
    findTerm = title =? "emulator"
    manageTerm = customFloating $ W.RationalRect l t w h
    -- manageTerm = doFloat
    -- manageTerm =  customFloatinga 
      where
        h = 0.51
        w = 0.48
        t = 0.95 - h
        l = 0.95 - w
    spawnTop = myTerminal ++ " -t top-scratchpad" ++ " -e tmux new -Assys btop"
    findTop = title =? "top-scratchpad"
    manageTop = customFloating $ W.RationalRect l t w h
    -- manageTop = doFloat
      where
        h = 0.67
        w = 0.56
        t = 0.98 - h
        l = 0.98 - w
    spawnTelegram = "telegram-desktop"
    findTelegram = className =? "TelegramDesktop"
    manageTelegram = customFloating $ W.RationalRect l t w h
    -- manageTelegram = doFloat
      where
        h = 0.5
        w = 0.3
        t = 0.04
        l = 0.84 - w

-- spawnCalc  = "qalculate-gtk"
-- findCalc   = className =? "Qalculate-gtk"
-- manageCalc = customFloating $ W.RationalRect l t w h
--            where
--              h = 0.5
--              w = 0.4
--              t = 0.75 -h
--              l = 0.70 -w



-- focusedScreenDimensions :: X Rectangle
-- focusedScreenDimensions = withWindowSet (return . screenRect . W.screenDetail . W.current)

-- customFloating :: X (Float, Float, Float, Float) -> ManageHook
-- customFloating = doFloatDep move

-- move :: W.RationalRect -> W.RationalRect
-- move (W.RationalRect x y w h) = W.RationalRect x y w h

-- customFloating :: X (Float, Float, Float, Float) -> ManageHook
-- customFloating = doFloatDep move

-- move :: W.RationalRect -> W.RationalRect
-- move (W.RationalRect x y w h) = W.RationalRect x y w h

-- oppositeScreen :: X (Float, Float, Float, Float) -> X (Float, Float, Float, Float)
-- oppositeScreen f = do
--   (x,y,w,h) <- f
--   (width,height) <- screenDimensions
--   return (x+(width-w-10), y+(height-h-10), w, h)

-- screenDimensions :: X (Float, Float)
-- screenDimensions = withWindowSet (return . screenRect . W.screenDetail . W.current) >>= (\rect -> return (fromIntegral $ rect_width rect, fromIntegral $ rect_height rect))

-- customFloating :: Rational -> Rational -> Rational -> Rational -> ManageHook
-- customFloating x y width height = do
--   win <- ask -- get Window
--   q <- liftX (floatLocation win) -- get (ScreenId, W.RationalRect)
--   let sid = fst q :: ScreenId
--       oirgRect = snd q :: W.RationalRect
--       ss2ss ss = -- :: StackSet ... -> StackSet ...
--         W.float win newRect ss where
--           mapping = map (\s -> (W.screen s, W.screenDetail s)) (c:v) where
--             c = W.current ss
--             v = W.visible ss
--           maybeSD = lookup sid mapping
--           scRect  = fmap screenRect maybeSD
--           newRect = case scRect of
--             Nothing -> oirgRect
--             Just (Rectangle x0 y0 w0 h0) ->
--               W.RationalRect x' y' w' h' where
--                 W.RationalRect x1 y1 w1 h1 = oirgRect
--                 x' = if x0 == 0 then x1 else x / (fromIntegral x0)
--                 y' = if y0 == 0 then y1 else y / (fromIntegral y0)
--                 w' = if w0 == 0 then w1 else width / (fromIntegral w0)
--                 h' = if h0 == 0 then h1 else height / (fromIntegral h0)
--   doF ss2ss


