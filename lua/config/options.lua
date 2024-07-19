vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.netrw_banner = true

vim.o.cursorline = true
vim.o.relativenumber = true
vim.o.updatetime = 50
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true


--[[ Python provider setup
  pyenv install 3.12.4
  pyenv virtualenv 3.4.4 neovim
  pyenv activate neovim
  python3 -m pip install pynvim
  pyenv which python
--]]
vim.g.python3_host_prog = "~/.pyenv/versions/neovim/bin/python"

