
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
vim.keymap.set("n", "<leader>r", ":sp<CR>:term python3 %<CR>")
-- -- [space + n] closes the closes the buffer and terminates the window
vim.keymap.set("n", "<leader>w", "<cmd>bd!<CR>")
vim.keymap.set("t", "<leader>w", "<C-\\><C-n><cmd>bd!<CR>")
--
-- Esc -> insert mode in the terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")



