require("joacoguzman.set")
require("joacoguzman.remap")
require("joacoguzman.lazy_init")

local augroup = vim.api.nvim_create_augroup
local JoacoGuzmanGroup = augroup('JoacoGuzman', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = JoacoGuzmanGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd('LspAttach', {
    group = JoacoGuzmanGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)                -- go to definition
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)                      -- hover docs
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts) -- workspace symbols
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)     -- diagnostics float
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)      -- code actions
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)       -- references
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)           -- rename symbol
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)         -- signature help
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)              -- next diagnostic
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)              -- prev diagnostic
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
