-- Line numbers
vim.opt.nu = true                 -- show absolute line numbers
vim.opt.relativenumber = true     -- relative numbers from cursor

-- Tabs & indentation
vim.opt.tabstop = 2               -- visual width of a tab
vim.opt.softtabstop = 2           -- spaces inserted/removed with Tab/BS
vim.opt.shiftwidth = 2            -- spaces used for auto-indent
vim.opt.expandtab = true          -- convert tabs to spaces
vim.opt.smartindent = true        -- smart auto-indentation

-- Wrapping
vim.opt.wrap = false              -- do not wrap long lines

-- Files
vim.opt.swapfile = false          -- disable swap files
vim.opt.backup = false            -- disable backup files

-- Search
vim.opt.hlsearch = false          -- no persistent search highlight
vim.opt.incsearch = true          -- incremental search highlight

-- UI
vim.opt.termguicolors = true      -- enable 24-bit colours
vim.opt.scrolloff = 8             -- keep 8 lines above/below cursor
vim.opt.signcolumn = "yes"        -- always show sign column
vim.opt.isfname:append("@-@")     -- allow '@' in file names

-- netrw (built-in file explorer)
vim.g.netrw_browse_split = 0      -- open files in same window
vim.g.netrw_banner = 0            -- hide netrw banner
vim.g.netrw_winsize = 25          -- netrw split size (if used)

-- vim.opt.colorcolumn = "80"     -- show column guide (optional)
