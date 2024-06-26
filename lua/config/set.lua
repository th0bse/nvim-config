vim.opt.nu = true 			                -- enable line numbers
vim.opt.relativenumber = true		        -- make line numbers relative to current line

vim.opt.tabstop = 4			                -- tabs are 4 characters long
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4			            -- make indenting 4 characters (8 is way too much)
vim.opt.expandtab = true		            -- spaces instead of actual tabs

vim.opt.smartindent = true		            -- better indenting

vim.opt.wrap = false			            -- no linewraps

vim.opt.swapfile = false		            -- no swapfile
vim.opt.backup = false			            -- no baclup file either
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true			            -- persistent undo

vim.opt.hlsearch = false		            -- don't keep search highlighting after searching
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8			            -- always have at least 8 more lines visible when scrolling
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "80"                  -- color the 80th column to remind me to not have huge single lines of code :)

vim.g.mapleader = " "                       -- set <leader> to spacebar
