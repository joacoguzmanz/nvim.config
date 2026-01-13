return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },

        config = function()
            local ls = require("luasnip")

            ls.filetype_extend("javascript", { "jsdoc" }) -- enable JSDoc snippets in JS

            vim.keymap.set("i", "<C-l>", function() ls.expand() end, { silent = true })           -- expand snippet
            vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(1) end, { silent = true })   -- next placeholder
            vim.keymap.set({ "i", "s" }, "<C-k>", function() ls.jump(-1) end, { silent = true })  -- previous placeholder
            vim.keymap.set({ "i", "s" }, "<C-e>", function()                                      -- cycle snippet choice
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })
        end,
    }
}
