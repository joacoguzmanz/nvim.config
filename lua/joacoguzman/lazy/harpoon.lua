return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end) -- add file to Harpoon
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end) -- Harpoon quick menu

        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end) -- go to Harpoon file 1
        vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end) -- go to Harpoon file 2
        vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end) -- go to Harpoon file 3
        vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end) -- go to Harpoon file 4

        vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end) -- previous Harpoon file
        vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end) -- next Harpoon file

        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        vim.keymap.set("n", "<leader>te", function()
            toggle_telescope(harpoon:list())
        end, { desc = "Open Harpoon Telescope picker" }) -- Harpoon picker in Telescope

        vim.keymap.set("n", "<leader>hr", function()
            harpoon:list():remove()
        end, { desc = "Remove current file from Harpoon" }) -- remove current file from Harpoon
    end
}
