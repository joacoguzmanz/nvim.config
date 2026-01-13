return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        require("telescope").setup({})

        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "find files" }) -- find files
        vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "git files" })        -- find git files

        vim.keymap.set("n", "<leader>pws", function()                                  -- grep word under cursor
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)

        vim.keymap.set("n", "<leader>pWs", function()                                  -- grep WORD under cursor
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)

        vim.keymap.set("n", "<leader>ps", function()                                   -- grep prompt
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
    end,
}
