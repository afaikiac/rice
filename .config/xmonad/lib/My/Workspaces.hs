module My.Workspaces 
    (
      myWorkspaces
    , myWorkspacesGreedyView
    , myWorkspacesShift
    , myWorkspacesList
    ) where

import Data.Tree
import XMonad
import XMonad.Actions.TreeSelect
import XMonad.Hooks.WorkspaceHistory
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import My.Theme.Light (myTreeFont)

--myWorkspaces :: [[Char]]
--myWorkspaces =  [" dev ", " www ", " doc ", " sys ", " vbox ",
--                " chat ", " mus ", " vid ", " gfx "]

myWorkspaces :: Forest String
myWorkspaces =
    [ Node "www" []
    , Node "dev" [
          Node "a" []
        , Node "b" []
    ]
    , Node "doc" [
          Node "a" []
        , Node "b" []
    ]
    , Node "sys" []
    -- , Node "vbox" []
    , Node "chat" []
    -- , Node "mus" []
    -- , Node "vid" []
    -- , Node "gfx" []
    ]

myTreeConfig :: TSConfig a
myTreeConfig =
    TSConfig
        { ts_hidechildren = False
        , ts_background = 0xc0000000
        , ts_font = myTreeFont
        , ts_node = (0xffd0d0d0, 0xff202331)
        , ts_nodealt = (0xffffffff, 0xff657b83)
        , ts_highlight = (0xff000000, 0xffcb4b16)
        , ts_extra = 0xffffffff
        , ts_node_width = 200
        , ts_node_height = 30
        , ts_originX = 15
        , ts_originY = 15
        , ts_indent = 80
        , ts_navigate = myTreeNavigation
        }

myTreeNavigation =
    M.fromList
        [ ((0, xK_Escape), cancel)
        , ((mod4Mask, xK_f), cancel)
        , ((0, xK_Return), select)
        , ((0, xK_space), select)
        , ((0, xK_Up), movePrev)
        , ((0, xK_Down), moveNext)
        , ((0, xK_Left), moveParent)
        , ((0, xK_Right), moveChild)
        , ((0, xK_k), movePrev)
        , ((0, xK_j), moveNext)
        , ((0, xK_h), moveParent)
        , ((0, xK_l), moveChild)
        , ((0, xK_o), moveHistBack)
        , ((0, xK_i), moveHistForward)
        -- , ((0, xK_d),        moveTo ["dev"])
        -- , ((0, xK_g),        moveTo ["graphics"])
        -- , ((0, xK_m),        moveTo ["music"])
        -- , ((0, xK_v),        moveTo ["video"])
        -- , ((0, xK_w),        moveTo ["web"])
        ]

myWorkspacesGreedyView = treeselectWorkspace myTreeConfig myWorkspaces W.greedyView
myWorkspacesShift = treeselectWorkspace myTreeConfig myWorkspaces W.shift
myWorkspacesList = toWorkspaces myWorkspaces
