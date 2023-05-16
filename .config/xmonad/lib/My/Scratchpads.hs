module My.Scratchpads
    (
      myScratchpadManageHook
    , myTopScratchpadAction
    , myEmulatorScratchpadAction
    -- , myTelegramScratchpadAction
    ) where

import XMonad.StackSet as W
import XMonad.ManageHook
import XMonad.Util.NamedScratchpad

import My.Vars (myTerminal)

myScratchpadManageHook = namedScratchpadManageHook myScratchPads
myTopScratchpadAction = namedScratchpadAction myScratchPads "top" 
myEmulatorScratchpadAction = namedScratchpadAction myScratchPads "emulator" 
-- myTelegramScratchpadAction = namedScratchpadAction myScratchPads "telegram" 

-- interesting https://github.com/gvolpe/nix-config/blob/6f9dbfe73020774a8fe6c5ba0bf9a15157e89019/home/programs/xmonad/config.hs#L461
myScratchPads :: [NamedScratchpad]
myScratchPads =
    [ NS 
        "top"
        (myTerminal ++ " -t top-scratchpad" ++ " -e tmux new -Assys btop")
        (title =? "top-scratchpad")
        (customFloating $ W.RationalRect (0.98 - 0.56) (0.98 - 0.67) (0.56) (0.67))
    , NS 
        "emulator"
        (myTerminal ++ " -t emulator" ++ " -e tmux-session-base")
        (title =? "emulator")
        (customFloating $ W.RationalRect (0.95 - 0.48) (0.95 - 0.51) (0.48) (0.51))
    -- , NS 
    --     "telegram"
    --     "telegram-desktop"
    --     (className =? "TelegramDesktop")
    --     (customFloating $ W.RationalRect (0.84 - 0.3) (0.04 - 0.5) (0.3) (0.5))
    ]

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


