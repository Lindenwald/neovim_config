
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

local function run_file()
    local file = vim.fn.expand("%:p")
    local filetype = vim.bo.filetype
    local cmd

    if filetype == "python" then
        -- Prefer .venv/bin/python if it exists
        local venv_python = vim.fn.getcwd() .. "/.venv/bin/python"

        if vim.fn.executable(venv_python) == 1 then
            cmd = venv_python .. " " .. vim.fn.shellescape(file)
        else
            cmd = "python3 " .. vim.fn.shellescape(file)
        end

    elseif filetype == "lua" then
        cmd = "lua " .. vim.fn.shellescape(file)

    elseif filetype == "javascript" then
        cmd = "node " .. vim.fn.shellescape(file)

    elseif filetype == "typescript" then
        cmd = "npx tsx " .. vim.fn.shellescape(file)

    elseif filetype == "rust" then
        cmd = "cargo run"

    elseif filetype == "go" then
        cmd = "go run " .. vim.fn.shellescape(file)

    elseif filetype == "c" then
        cmd = "gcc " .. vim.fn.shellescape(file) .. " -o /tmp/nvim_program && /tmp/nvim_program"

    elseif filetype == "cpp" then
        cmd = "g++ " .. vim.fn.shellescape(file) .. " -o /tmp/nvim_program && /tmp/nvim_program"

    else
        vim.notify("No run command for filetype: " .. filetype, vim.log.levels.WARN)
        return
    end

    vim.cmd("rightbelow vnew")
    vim.cmd("term " .. cmd)
end

vim.keymap.set("n", "<leader>r", run_file, {
    desc = "Run current file",
})
