
-- General quality of life
--
-- -- jk == Esc
vim.keymap.set("i", "jk", "<Esc>")
--
-- -- quicksave [space + s]
vim.keymap.set("n", "<leader>s", "<cmd>write<CR>")


-- Runing code in a new terminal buffer
--
-- -- [space + r] runs code in a new terminal buffer
-- * -- vim.keymap.set("n", "<leader>r", ":vnew<CR>:term python3 %<CR>")
-- The following should open to the right
-- * -- vim.keymap.set("n", "<leader>r", ":rightbelow vnew<CR>:term python3 %<CR>")
--
-- -- [space + n] closes the closes the buffer and terminates the window
vim.keymap.set("n", "<leader>w", "<cmd>bd!<CR>")
vim.keymap.set("t", "<leader>w", "<C-\\><C-n><cmd>bd!<CR>")
--
-- Esc -> insert mode in the terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")


----- Trying stuff *

-- Run the current file with <leader>r
local function run_file()
    -- Get the full path of the current file
    local file = vim.fn.expand("%:p")

    -- Get the filetype detected by Neovim
    local ft = vim.bo.filetype

    -- Commands for each supported filetype
    -- %s will be replaced with the current file path
    local commands = {
        -- Run a Lua file
        lua = "lua %s",

        -- Run a Scala file
        scala = "scala %s",

        -- Compile and run a C file
        c = "gcc %s -o /tmp/nvim_program && /tmp/nvim_program",

        -- Compile and run a C++ file
        cpp = "g++ %s -o /tmp/nvim_program && /tmp/nvim_program",
    }

    -- Get the command corresponding to the current filetype
    local cmd = commands[ft]

    -- Python needs special handling for virtual environments
    if ft == "python" then
        -- Look for a Python executable inside the project's .venv
        local python = vim.fn.getcwd() .. "/.venv/bin/python"

        -- If the virtual environment exists, use its Python
        -- Otherwise, fall back to the system's python3
        if vim.fn.executable(python) ~= 1 then
            python = "python3"
        end

        -- Build the Python command
        cmd = python .. " %s"
    end

    -- Stop if this filetype isn't supported
    if not cmd then
        vim.notify("No run command for: " .. ft, vim.log.levels.WARN)
        return
    end

    -- Replace %s with the actual file path
    -- shellescape() protects paths containing spaces or special characters
    cmd = string.format(cmd, vim.fn.shellescape(file))

    -- Create a vertical split below the current window
    vim.cmd("rightbelow vnew")

    -- Open a terminal in the new window and execute the command
    vim.cmd("term " .. cmd)
end

-- Run the function when <leader>r is pressed in normal mode
vim.keymap.set("n", "<leader>r", run_file, {
    desc = "Run current file",
})
