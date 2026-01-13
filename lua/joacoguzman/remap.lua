vim.g.mapleader = " "                                   -- leader is Space

-- File explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)            -- open netrw (:Ex)

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")             -- move selection down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")             -- move selection up

-- Keep cursor centred when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")                  -- half-page down + centre
vim.keymap.set("n", "<C-u>", "<C-u>zz")                  -- half-page up + centre

-- Paste without overwriting yank
vim.keymap.set("x", "<leader>p", [["_dP]])               -- paste over selection, keep yank

-- System clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])         -- yank to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])                -- yank whole line to clipboard
vim.keymap.set("n", "<leader>P", [["+p]])                -- paste from clipboard (normal)

-- Delete without yanking
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])         -- delete to black-hole register

-- Insert mode convenience
vim.keymap.set("i", "<C-c>", "<Esc>")                    -- exit insert mode

-- LSP
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)     -- format file via LSP

-- Search & replace
vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
)                                                        -- substitute word under cursor

-- Comment block (useful for JSX/TSX)
vim.keymap.set(
  "x",
  "<leader>c",
  ":s/^/\\{\\/\\*/ | s/$/\\*\\/\\}<CR>gv"
)                                                        -- wrap selection in {/* */}
