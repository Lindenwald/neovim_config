vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")

vim.opt.timeoutlen = 150

require("config.options")
require("config.keymaps")
require("config.plugins")


