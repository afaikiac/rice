require("user.plugins.configs.keymaps").set_openbrowser_mappings()
vim.g["openbrowser_search_engines"] = { startpage = "https://www.startpage.com/do/search?query={query}", }
vim.g["openbrowser_default_search"] = "startpage"
