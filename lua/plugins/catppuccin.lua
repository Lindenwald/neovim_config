return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
		bakground = { light = "frappe", 
			dark = "mocha" --:h background
		}


            })

            vim.cmd.colorscheme("catppuccin")
        end,
    },
}

