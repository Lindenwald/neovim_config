return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    local ts = require("nvim-treesitter")

    -- Install the parsers you want.
    ts.install({
      "bash",
      "c",
      "cpp",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "vim",
      "vimdoc",
    })

    -- Enable Treesitter features for supported filetypes.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "bash",
        "c",
        "cpp",
        "lua",
        "markdown",
        "python",
        "query",
        "vim",
        "vimdoc",
      },
      callback = function()
        -- Syntax highlighting
        vim.treesitter.start()

        -- Treesitter folding
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldmethod = "expr"

        -- Treesitter indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}



