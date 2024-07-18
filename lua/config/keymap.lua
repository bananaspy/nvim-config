local map = LazyUtil.safe_keymap_set

map("i", "jk", "<Esc>", { desc = "Esc hotkey" })
map("n", "<leader>dd", vim.cmd.Ex, { desc = "Open netrw" })

-- vim.keymap.set("i", "jk", "<Esc>")
-- vim.keymap.set("n", "<leader>dd", vim.cmd.Ex)

