

-- Options before lazy
vim.opt.timeoutlen = 150
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.plugins")

-- Options
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"


