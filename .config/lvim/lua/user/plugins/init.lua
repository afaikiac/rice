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
			vim.o.background = "dark"
			require("user.plugins.configs.gruvbox")
			lvim.colorscheme = "gruvbox"
		end,
		cond = function()
			local _time = os.date("*t")
			return (_time.hour >= 5 and _time.hour < 19) and lvim.builtin.time_based_themes
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			vim.o.background = "dark"
			lvim.colorscheme = "kanagawa"
		end,
		cond = function()
			local _time = os.date("*t")
			return ((_time.hour >= 19 and _time.hour < 24) or (_time.hour >= 0 and _time.hour < 5))
				and lvim.builtin.time_based_themes
		end,
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
	},
	{
		"zbirenbaum/copilot.lua",
		event = { "VimEnter" },
		config = function()
			require("user.plugins.configs.copilot")
		end,
		enabled = lvim.builtin.sell_your_soul_to_devil.prada,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("user.plugins.configs.copilot-cmp")
		end,
		dependencies = { "zbirenbaum/copilot.lua", "hrsh7th/nvim-cmp" },
		enabled = lvim.builtin.sell_your_soul_to_devil.prada,
	},
	-- {
	-- 	"Exafunction/codeium.vim",
	-- 	enabled = false,
	-- },
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
		"norcalli/nvim-colorizer.lua", -- color highlighter
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
		lazy = true,
		ft = { "markdown" },
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
		event = "VeryLazy",
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
