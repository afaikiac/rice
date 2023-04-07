reload("user.plugins.configs.cmp")
reload("user.plugins.configs.telescope")
reload("user.plugins.configs.treesitter")
reload("user.plugins.configs.alpha")
reload("user.plugins.configs.nvimtree")
-- reload "user.plugins.configs.nvim-autopairs"

lvim.plugins = {
	{
		"ellisonleao/gruvbox.nvim",
		-- lazy = false, priority = 1000,
		config = function()
			vim.o.background = "light"
			require("user.plugins.configs.gruvbox")
			lvim.colorscheme = "gruvbox"
		end,
		cond = function()
			local _time = os.date("*t")
			return (_time.hour >= 5 and _time.hour < 19) and lvim.builtin.time_based_themes
				or not lvim.builtin.time_based_themes
		end,
		-- enabled = false,
	},
	{
		"rebelot/kanagawa.nvim",
		-- enabled = false,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup()
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			vim.o.background = "light"
			lvim.colorscheme = "catppuccin-latte"
		end,
		cond = function()
			local _time = os.date("*t")
			return ((_time.hour >= 19 and _time.hour < 24) or (_time.hour >= 0 and _time.hour < 5))
				and lvim.builtin.time_based_themes
		end,
	},
	{
		"LukasPietzschmann/telescope-tabs",
		config = function()
			require("user.plugins.configs.telescope-tabs")
		end,
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	{
		"tyru/open-browser.vim",
		config = function()
			require("user.plugins.configs.openbrowser")
		end,
		enabled = false,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = { "BufRead", "BufNew" },
		config = function()
			require("user.plugins.configs.lsp_signature")
		end,
	},
	{
		"folke/todo-comments.nvim", -- highlight and search for todo comments
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},
	{
		"NvChad/nvim-colorizer.lua", -- color highlighter
		event = "BufRead",
		config = function()
			require("user.plugins.configs.colorizer")
		end,
	},
	{
		"mbbill/undotree",
		lazy = true,
		cmd = "UndotreeToggle",
		init = function()
			require("user.plugins.configs.which-key").set_undotree_mappings()
		end,
	},
	{
		"ethanholz/nvim-lastplace", -- pick up where you left off
		event = "BufRead",
		config = function()
			require("user.plugins.configs.nvim-lastplace")
		end,
	},
	{
		"lyokha/vim-xkbswitch",
		event = "BufRead",
		init = function()
			require("user.plugins.configs.vim-xkbswitch")
		end,
	},
	{
		"epwalsh/obsidian.nvim",
		-- 02-04-23 cmp completions don't work
		config = function()
			require("user.plugins.configs.obsidian")
		end,
		-- enabled = false,
	},
	{
		"iamcco/markdown-preview.nvim",
		-- lazy = true,
		ft = { "markdown" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
	},
	{
		"goerz/jupytext.vim",
		-- event = "VeryLazy",
		init = function()
			require("user.plugins.configs.jupytext")
		end,
	},
	{
		"hkupty/iron.nvim",
		lazy = true,
		ft = { "python" },
		config = function()
			require("user.plugins.configs.iron")
		end,
	},
	{
		"GCBallesteros/vim-textobj-hydrogen",
		lazy = true,
		ft = { "python" },
		dependencies = { "kana/vim-textobj-user" },
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		config = function()
			require("user.plugins.configs.persistence")
		end,
		enabled = lvim.builtin.persistence.active,
	},
	{
		"christoomey/vim-tmux-navigator",
		cond = os.getenv("TMUX") ~= nil,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("user.plugins.configs.mason-tool-installer")
		end,
		dependencies = { "williamboman/mason.nvim" },
	},
	{
		"kdheepak/cmp-latex-symbols",
		dependencies = { "hrsh7th/nvim-cmp" },
		ft = "tex",
		init = function()
			require("user.plugins.configs.cmp-latex-symbols")
		end,
	},
	{
		"lervag/vimtex",
		-- ft = "tex",
		-- config = function()
		--     vim.call('vimtex#init()')
		-- --     vim.g.maplocalleader = ','
		-- end,
	},
	{
		"folke/twilight.nvim",
		lazy = true,
		cmd = "Twilight",
		config = function()
			require("user.plugins.configs.twilight")
		end,
	},
	{
		"junegunn/vim-easy-align",
		config = function()
			require("user.plugins.configs.vim-easy-align")
		end,
	},
	{
		"quarto-dev/quarto-nvim",
		dependencies = {
			"jmbuhr/otter.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("quarto").setup({
				lspFeatures = {
					enabled = true,
					languages = { "r", "python", "julia" },
					diagnostics = {
						enabled = true,
						triggers = { "BufWrite" },
					},
					completion = {
						enabled = true,
					},
				},
			})
		end,
	},
	-- TODO: https://github.com/jpalardy/vim-slime
	-- https://github.com/jmbuhr/quarto-nvim-kickstarter
	-- {
	--   -- enable builtin spellchecker for buffers with tree-sitter highlighting
	--   -- see https://github.com/lewis6991/spellsitter.nvim
	--   'lewis6991/spellsitter.nvim',
	--   config = function()
	--     require("spellsitter").setup {
	--       -- enable_builtin_spellchecker = true,
	--       -- enable_builtin_spellchecker_for_tree_sitter = true,
	--       enable = true,
	--       debug = false,
	--     }
	--   end
	-- },
}
